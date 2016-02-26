class InventoryManagementController < ApplicationController
  
  before_action :authenticate_admin!


  def recipes
    @recipes = Recipe.search(params[:search_recipes]).page(params[:page]).per(50)

    # @ingredients and @equipment store search results for ingredients and equipment respectively
    # in the partials rendered within recipes
    @ingredients = Ingredient.search(params[:search_ingredients]).page(params[:page]).per(50)
    @equipment = Equipment.search(params[:search_equipment]).page(params[:page]).per(50)

    # ingredients and equipment to add to recipe
    @ingredients_for_recipe = {ingredients: [], quantities: []}
    @equipment_for_recipe = {equipment: [], types: []}



    # add ingredients that have previously been added
    if params.has_key?(:existing_ingredients_code_for_recipe)
      params[:existing_ingredients_code_for_recipe].each do |code|
        ingredient = Ingredient.find_by code: code
        @ingredients_for_recipe[:ingredients] << ingredient
      end
    end
    # add the last entered ingredient
    if params.has_key?(:ingredient_code)
      ingredient = Ingredient.find_by code: params[:ingredient_code]
      @ingredients_for_recipe[:ingredients] << ingredient if !(ingredient.nil?)
    end

    # add ingredients quantities that have previously been added
    if params.has_key?(:existing_ingredients_quantity_for_recipe)
      params[:existing_ingredients_quantity_for_recipe].each do |quantity|
        @ingredients_for_recipe[:quantities] << quantity
      end
    end
    # add the last entered ingredient quantity
    if params.has_key?(:ingredient_quantity)
      quantity_s = params[:ingredient_quantity]
      if !(quantity_s.nil?)
        quantity = (quantity_s.to_i != 0) ?  quantity_s.to_f : 1.0
        @ingredients_for_recipe[:quantities] << quantity
      end
    end


    # add equipment that have previously been added
    if params.has_key?(:existing_equipment_code_for_recipe)
      params[:existing_equipment_code_for_recipe].each do |code|
        equipment = Equipment.find_by code: code
        @equipment_for_recipe[:equipment] << equipment if !(equipment.nil?)
      end
    end
    # add the last entered equipment
    if params.has_key?(:equipment_code)
        equipment = Equipment.find_by code: params[:equipment_code]
      @equipment_for_recipe[:equipment] << equipment if !(equipment.nil?)
    end

    # add equipment types that have previously been added
    if params.has_key?(:existing_equipment_type_for_recipe)
      params[:existing_equipment_type_for_recipe].each do |type|
        @equipment_for_recipe[:types] << type
      end
    end
    # add the last entered equipment type
    if params.has_key?(:equipment_type)
      @equipment_for_recipe[:types] << params[:equipment_type]
    end


  end



  def create_recipe




    render nothing: true
    
  end



  def ingredients
    @ingredients = Ingredient.search(params[:search]).page(params[:page]).per(50)
  end

  def create_ingredient
    param_ingredient = params[:ingredient]
    if !(param_ingredient.nil?)
      if !(param_ingredient[:name] === '') && !(param_ingredient[:price] === '') && !(param_ingredient[:unit] === '') && !(param_ingredient[:interval] === '')
    	  # create new ingredient record
        ingredient = Ingredient.new(ingredient_params)
        ingredient.save
        ingredient.code = 'IN' + (ingredient.id + 300).to_s.rjust(3, '0')
        ingredient.save
      end
    end

    render nothing: true
  end


  def equipment
    @equipment = Equipment.search(params[:search]).page(params[:page]).per(50)
  end

  def create_equipment
    param_equipment = params[:equipment_singular]
    if !(param_equipment.nil?)
      if !(param_equipment[:name] === '') && !(param_equipment[:price] === '')
        # create new equipment record
        equipment = Equipment.new(equipment_params)
        equipment.save
        equipment.code = 'EQ' + (equipment.id + 300).to_s.rjust(3, '0')
        equipment.save
      end
    end

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