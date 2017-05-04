class AddRegionToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :region, :string
  end
end
