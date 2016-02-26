class AddPaxToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :pax, :integer
  end
end
