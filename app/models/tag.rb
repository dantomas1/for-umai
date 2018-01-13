class Tag < ActiveRecord::Base
 has_many :listitems
 #serialize :items, Array
end
