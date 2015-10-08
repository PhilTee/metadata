class Metavalue < ActiveRecord::Base
  belongs_to :user
  belongs_to :metakey
  
  def find_by_metakey_name()
  end
  
end
