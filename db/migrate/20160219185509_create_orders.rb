class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :recipe_code
      t.text :ingredients_info
      t.text :equipment_info

      t.timestamps null: false
    end
  end
end
