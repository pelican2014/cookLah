class InventoryManagementController < ApplicationController
  
  before_action :authenticate_admin!


  def recipes
    @recipes = Recipe.search(params[:search]).page(params[:page]).per(50)
  end



  def ingredients
    @ingredients = Ingredient.search(params[:search]).page(params[:page]).per(50)
  end

  def create_ingredient

	  # create new ingredient record
    ingredient = Ingredient.new(ingredient_params)
    ingredient.save


    render nothing: true
    
  end


  def equipment
    @equipment = Equipment.search(params[:search]).page(params[:page]).per(50)
  end

  def create_equipment

    # create new equipment record
    equipment = Equipment.new(equipment_params)
    equipment.save


    render nothing: true
    
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :price, :unit, :interval)
    end

    def equipment_params
      params.require(:equipment_singular).permit(:name, :price)
    end

end