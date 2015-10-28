class User < ActiveRecord::Base
  has_many :metavalues, inverse_of: :user
  has_many :metakeys, through: :metavalues
  
  accepts_nested_attributes_for :metavalues

  attr_accessor :metadata

  def metadata
    @metadata ||= buildmetadata
  end

  private

  def buildmetadata
    #TODO: Might need to optimise this in the future, as this is an N+1 source.
    @metadata = Hash.new
    self.metavalues.map { |v| @metadata[ v.metakey.name ] = v.value  }
    return @metadata
  end

end
