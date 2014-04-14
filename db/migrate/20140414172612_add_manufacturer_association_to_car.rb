class AddManufacturerAssociationToCar < ActiveRecord::Migration
  def up
    add_column :cars, :manufacturer_id, :integer
  end

  def down
    remove_column :cars, :manufacturer_id
  end
end
