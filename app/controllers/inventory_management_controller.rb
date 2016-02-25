class InventoryManagementController < ApplicationController
  
  before_action :authenticate_admin!


  def recipes
    @recipes = Recipe.search(params[:search]).page(params[:page]).per(50)

    # @ingredients and @equipment store search results for ingredients and equipment respectively
    # in the partials rendered within recipes
    @ingredients = Ingredient.search(params[:search]).page(params[:page]).per(50)
    @equipment = Equipment.search(params[:search]).page(params[:page]).per(50)

    # ingredients and equipment to add to recipe
    @ingredients_for_recipe = []
    @equipment_for_recipe = []

    # add ingredients that have previously been added
    if params.has_key?(:existing_ingredients_code_for_recipe)
      params[:existing_ingredients_code_for_recipe].each do |code|
        @ingredients_for_recipe << (Ingredient.find_by code: code)
      end
    end

    # add the last entered ingredient
    if params.has_key?(:ingredient_code)
      @ingredients_for_recipe << (Ingredient.find_by code: params[:ingredient_code])
    end


  end



  def create_recipe




    render nothing: true
    
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