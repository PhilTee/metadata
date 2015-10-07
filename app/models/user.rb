class User < ActiveRecord::Base
  has_many :metavalues
  has_many :metakeys, through: :metavalues

  after_initialize :buildmetadata

  def metadata
    @metadata
  end

  #TODO: Need to capture changes to self.metadata to feed these back into ActiveRecord

  private

  def buildmetadata
    @metadata = {};
    self.metavalues.map { |v| @metadata[ v.metakey.name.parameterize.underscore.to_sym ] = v.value  }
  end

end
