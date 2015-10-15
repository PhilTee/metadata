class Metavalue < ActiveRecord::Base
  belongs_to :user
  belongs_to :metakey, inverse_of: :metavalues
end