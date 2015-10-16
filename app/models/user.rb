class User < ActiveRecord::Base
  has_many :metavalues
  has_many :metakeys, through: :metavalues

  attr_accessor :metadata

  def metadata
    @metadata ||= buildmetadata
  end

  def metadata= (values)
    @metadata ||= buildmetadata

    # Currently accepts all values presented.
    #TODO: This will be replaced with a check against the permitted metakeys defined in a facet
    #filtered = values.select{ |k,v| @metadata.has_key?(k.to_s) } <<<<---- This will be replaced with the Facet check
    #filtered.each do |key,val|
    values.each do |key,val|
      begin
        mv = self.metakeys.find_by_name(key).metavalues.find_by_user_id(self.id)
      rescue => e
        # create missing metavalue
        mv = self.metavalues.create(metakey_id: Metakey.find_by_name(key).id)
      end
      
      if mv
        # Update existing metavalue
        mv.value=val
        mv.save
      end
      
    end
    
    #@metadata.merge!(filtered)
    @metadata.merge!(values)
  end

  private

  def buildmetadata
    #TODO: Might need to optimise this in the future, as this is an N+1 source.
    @metadata = Hash.new
    self.metavalues.map { |v| @metadata[ v.metakey.name ] = v.value  }
    return @metadata
  end

end
