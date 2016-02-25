class AddSymbolDietaryRestrictionCookingTimeLevelOfDifficultyToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :symbol, :string
    add_column :recipes, :dietary_restriction, :string
    add_column :recipes, :string, :string
    add_column :recipes, :cooking_time, :string
    add_column :recipes, :level_of_difficulty, :string
  end
end
