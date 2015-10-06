class Metakey < ActiveRecord::Base
  has_many :metavalues
  has_and_belongs_to_many :facets
end
