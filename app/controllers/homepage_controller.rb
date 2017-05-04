class HomepageController < ApplicationController
  
  # before_action :authenticate_admin!


  def recipes
    @recipes = Recipe.search(params[:search_recipes]).page(params[:page]).per(50)

    # @ingredients and @equipment store search results for ingredients and equipment respectively
    # in the partials rendered within recipes
    @ingredients = Ingredient.search(params[:search_ingredients]).page(params[:page]).per(10)
    @equipment = Equipment.search(params[:search_equipment]).page(params[:page]).per(10)

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



  def create_recipe_cooking_instructions
    # store information about ingredients and equipment
    @recipe_ingredients_and_equipment = params[:recipe_ingredients_and_equipment]

    # convert to string when first retrieved
    if !(@recipe_ingredients_and_equipment.is_a?(String))
      require 'json'
      @recipe_ingredients_and_equipment = @recipe_ingredients_and_equipment.to_json
    end


    # create array to store cooking steps
    @cooking_instructions = []

    # retrieve information about previously added steps
    existing_steps = params[:existing_steps]
    if !(existing_steps.nil?)
      existing_steps.each do |step|
        @cooking_instructions << step
      end
    end

    # add new cooking instruction
    new_step = params[:new_step]
    if !(new_step.nil?)
      @cooking_instructions << new_step
    end
    
  end


  def create_recipe_configuration
    # store information about ingredients, equipment and cooking instructions
    @recipe_ingredients_and_equipment = params[:recipe_ingredients_and_equipment]
    @cooking_instructions = params[:cooking_instructions]

    # convert @cooking_instructions to string when first retrieved
    if !(@cooking_instructions.is_a?(String))
      require 'json'
      @cooking_instructions = @cooking_instructions.to_json
    end

  end


  def create_recipe
    require 'json'

    # $5.00 is the starting price
    price = 5.0

    recipe_ingredients_and_equipment = JSON.parse(params[:recipe_ingredients_and_equipment])

    ingredients = {}
    ingredient_code_arr = recipe_ingredients_and_equipment['ingredients']['code']
    quantity_arr = recipe_ingredients_and_equipment['ingredients']['quantity']

    1.upto(ingredient_code_arr.length) do |i|
      # ingredients store a hash {code => quantity}
      ingredients[ingredient_code_arr[i-1]] = quantity_arr[i-1]

      # sum up ingredient price
      ingredient = Ingredient.find_by code: ingredient_code_arr[i-1]
      redirect_to homepage_recipes_path if ingredient.nil? # shouldn't happen
      price += ingredient.price * quantity_arr[i-1].to_f

    end

    equipment = {}
    if !(recipe_ingredients_and_equipment['equipment'].nil?)
      equipment_code_arr = recipe_ingredients_and_equipment['equipment']['code']
      type_arr = recipe_ingredients_and_equipment['equipment']['type']
      1.upto(equipment_code_arr.length) do |i|
        # equipment store a hash {code => type}
        equipment[equipment_code_arr[i-1]] = type_arr[i-1]

        # sum up equipment price
        equipment_singular = Equipment.find_by code: equipment_code_arr[i-1]
        redirect_to homepage_recipes_path if equipment_singular.nil? # shouldn't happen
        price += equipment_singular.price
      end
    end


    cooking_instructions = JSON.parse(params[:cooking_instructions])


    recipe = Recipe.new(recipe_params)
    recipe.price = price
    recipe.ingredients = ingredients
    recipe.equipment = equipment
    recipe.instructions = cooking_instructions
    recipe.save
    recipe.code = 'RC' + (recipe.id + 300).to_s.rjust(3, '0')
    recipe.save


    redirect_to homepage_recipes_path

  end


  def read_recipe

    @recipe = Recipe.find(params[:id])

    @ingredients = []
    @quantities = []
    @recipe.ingredients.each do |code, quantity|
      ingredient = Ingredient.find_by code: code

      if ingredient.nil?
        @recipe.destroy
        # store error messages (todo)
        redirect_to homepage_recipes_path
      end

      @ingredients << ingredient 
      @quantities << quantity
    end


    @equipment = []
    @types = []
    @recipe.equipment.each do |code, type|
      equipment = Equipment.find_by code: code

      if equipment.nil?
        @recipe.destroy
        # store error messages (todo)
        redirect_to homepage_recipes_path
      end

      @equipment << equipment
      @types << type
    end

  end


  def delete_recipe
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to homepage_recipes_path
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

  def delete_ingredient
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    redirect_to homepage_ingredients_path
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

  def delete_equipment
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    redirect_to homepage_equipment_path
  end


  # output inventory information in json
  # change the function when adding / removing fields from database
  def secret_rendezvous
    @inventory = {:ingredients => [], :equipment => [], :recipes => []}

    Ingredient.all.each do |ingredient|
      @inventory[:ingredients] << {code: ingredient.code, name: ingredient.name, unit: ingredient.unit,
                                    price: ingredient.price, interval: ingredient.interval}
    end

    Equipment.all.each do |equipment|
      @inventory[:equipment] << {code: equipment.code, name: equipment.name, price: equipment.price}
    end

    Recipe.all.each do |recipe|
      @inventory[:recipes] << {ingredients: recipe.ingredients, equipment: recipe.equipment,
                                instructions: recipe.instructions, name: recipe.name, code: recipe.code,
                                  symbol: recipe.symbol, dietary_restriction: recipe.dietary_restriction,
                                   cooking_time: recipe.cooking_time, level_of_difficulty: recipe.level_of_difficulty,
                                    region: recipe.region, price: recipe.price,
                                      pax: recipe.pax}
    end

    require 'json'
    @inventory = @inventory.to_json

  end





  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :price, :unit, :interval)
    end

    def equipment_params
      params.require(:equipment_singular).permit(:name, :price)
    end

    def recipe_params
      params.permit(:name, :region, :symbol, :dietary_restriction, :cooking_time, :level_of_difficulty, :pax)
    end
end