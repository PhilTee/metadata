class Metavalue < ActiveRecord::Base
  belongs_to :user
  belongs_to :metakey
  
end
