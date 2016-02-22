class Recipe < ActiveRecord::Base
	serialize :ingredients
	serialize :equipment
	serialize :instructions
end
