class InventoryManagementController < ApplicationController
  
  before_action :authenticate_admin!

  def recipes
  end

  def ingredients
    @ingredients = Ingredient.search(params[:search]).page(params[:page]).per(20)
  end

  def equipment
  end
  
end