class AddPriceToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :price, :decimal
  end
end
