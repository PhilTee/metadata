class User < ActiveRecord::Base
  has_many :metavalues
  has_many :metakeys, through: :metavalues

  def metadata
    @metadata ||= buildmetadata
  end

  def metadata= (values)
    puts "metadata setter here!"
    @metadata ||= buildmetadata
    
    #Reject any values that aren't already present in metadata
    filtered = values.select{ |k,v| puts "#{k}"; @metadata.has_key?(k.to_s) }
    filtered.inspect
    filtered.each do |key,val|
      
      puts "Processing #{key}..."
      mv = self.metavfind_by_name(key)
      if mv
        puts "\t Got a hit!"
        mv.value=val
        #u.save
      end
    end
    
  end

  private

  def buildmetadata
    #TODO: Might need to optimise this in the future, as this is an N+1 source.
    @metadata = Hash.new
    self.metavalues.map { |v| @metadata[ v.metakey.name ] = v.value  }
    return @metadata
  end

end
