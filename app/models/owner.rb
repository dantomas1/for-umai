class Owner < ActiveRecord::Base 
  self.primary_key = "owner_name"
  has_many :articles
  
  def to_param
  "#{id}-#{owner_name}"
   end
end
