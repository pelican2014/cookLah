class Order < ActiveRecord::Base
	serialize :ingredients_info
	serialize :equipment_info
end
