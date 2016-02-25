class RemoveStringFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :string, :string
  end
end
