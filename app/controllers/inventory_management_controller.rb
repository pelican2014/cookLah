class InventoryManagementController < ApplicationController
  
  before_action :authenticate_admin!

  def recipes
  end

  def ingredients
    @ingredients = Ingredient.search(params[:search]).page(params[:page]).per(20)
  end


  def create_ingredients

  	# create a new ingredient record for each field in the submitted form
  	params[:fields].each do |i, values|

  	  # screen the values (compulsory for Rails 4)
  	  permitted_values = values.permit(:name, :price, :unit, :interval)

  	  # create new ingredient record
      ingredient = Ingredient.new(permitted_values)
      ingredient.save
    end

    render nothing: true
  end


  def equipment
  end

end