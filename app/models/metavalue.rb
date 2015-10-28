class Metavalue < ActiveRecord::Base
  belongs_to :user, inverse_of: :metavalues
  belongs_to :metakey, inverse_of: :metavalues

  validates_presence_of :user
  validate :correct_format
  
  def correct_format
    case self.metakey.typeof 
    when "d"
      begin
        Date.strptime(self.value,"%d/%m/%Y").is_a?(Date)
      rescue Exception => e
        errors.add(:value, "Dates need to be in the format dd/mm/yyyy")
      end
    when "i"
      errors.add(:value, "Please enter a valid whole number") unless self.value.to_i.is_a?(Integer)
    when "s"
      errors.add(:value, "Not a string?! What??") unless self.value.is_a?(String)
    else
      errors.add(:value, "Invalid format?! Are you a hacker?")
    end
    
  end
  
end
