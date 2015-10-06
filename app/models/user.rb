class User < ActiveRecord::Base
  has_many :metavalues
  has_many :metakeys, through: :metavalues
  
end
