class InventoryManagementController < ApplicationController
  
  before_action :authenticate_admin!


  def recipes
    @recipes = Recipe.search(params[:search_recipes]).page(params[:page]).per(50)

    # @ingredients and @equipment store search results for ingredients and equipment respectively
    # in the partials rendered within recipes
    @ingredients = Ingredient.search(params[:search_ingredients]).page(params[:page]).per(50)
    @equipment = Equipment.search(params[:search_equipment]).page(params[:page]).per(50)

    # ingredients and equipment to add to recipe
    @ingredients_for_recipe = []
    @equipment_for_recipe = []



    # add ingredients that have previously been added
    if params.has_key?(:existing_ingredients_code_for_recipe)
      params[:existing_ingredients_code_for_recipe].each do |code|
        ingredient = Ingredient.find_by code: code
        @ingredients_for_recipe << ingredient if !(ingredient.nil?)
      end
    end

    # add the last entered ingredient
    if params.has_key?(:ingredient_code)
      ingredient = Ingredient.find_by code: params[:ingredient_code]
      @ingredients_for_recipe << ingredient if !(ingredient.nil?)
    end


    # add equipment that have previously been added
    if params.has_key?(:existing_equipment_code_for_recipe)
      params[:existing_equipment_code_for_recipe].each do |code|
        equipment = Equipment.find_by code: code
        @equipment_for_recipe << equipment if !(equipment.nil?)
      end
    end

    # add the last entered equipment
    if params.has_key?(:equipment_code)
        equipment = Equipment.find_by code: params[:equipment_code]
      @equipment_for_recipe << equipment if !(equipment.nil?)
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
    ingredient.code = 'IN' + (ingredient.id + 300).to_s.rjust(3, '0')
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
    equipment.code = 'IN' + (equipment.id + 300).to_s.rjust(3, '0')
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