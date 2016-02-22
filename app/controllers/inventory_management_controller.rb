class InventoryManagementController < ApplicationController
  
  before_action :authenticate_admin!

  def recipes
  end

  def ingredients
  	@ingredient = Ingredient.first
  end

  def equipment
  end
end
