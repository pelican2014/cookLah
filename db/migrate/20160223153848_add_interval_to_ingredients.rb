class AddIntervalToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :interval, :decimal
  end
end
