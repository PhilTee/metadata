class Metavalue < ActiveRecord::Base
  belongs_to :user
  has_one :metakey
end
