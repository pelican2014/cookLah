class AddTypeToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :type, :string
  end
end
