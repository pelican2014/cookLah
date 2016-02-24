class InventoryManagementController < ApplicationController
  
  before_action :authenticate_admin!

  def recipes
  end

  def ingredients
    @ingredients = Ingredient.search(params[:search]).page(params[:page]).per(20)
  end

  def create_ingredients
  	ingredient_params(fields).each do |i, values|
      @ingredient = Ingredient.new(values)
      @ingredient.save
    end

    render nothing: true
  end

  def equipment
  end
  
  private
  	def ingredient_params(fields)
  		params.require(fields).permit(:name, :price, :unit, :interval)
  	end
end