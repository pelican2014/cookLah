class InventoryManagementController < ApplicationController
  
  before_action :authenticate_admin!


  def recipes
  end


  def ingredients
    @ingredients = Ingredient.search(params[:search]).page(params[:page]).per(20)
  end

  def create_ingredients

	  # create new ingredient record
    ingredient = Ingredient.new(ingredient_params)
    ingredient.save


    render nothing: true
    
  end


  def equipment
  end


  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :price, :unit, :interval)
    end

end