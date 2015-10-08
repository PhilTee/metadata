class Metakey < ActiveRecord::Base
  has_many :metavalues
  has_and_belongs_to_many :facets
  
  def name=(key_name)
    self[:name] = key_name.parameterize.underscore.to_sym
  end
    
end
