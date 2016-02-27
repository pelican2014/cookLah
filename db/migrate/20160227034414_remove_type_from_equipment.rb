class RemoveTypeFromEquipment < ActiveRecord::Migration
  def change
    remove_column :equipment, :type, :string
  end
end
