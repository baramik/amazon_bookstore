class CreateShipments < ActiveRecord::Migration
  def up
    create_table :shipments do |t|
      t.string :name
      t.float :price

      t.timestamps
    end
  end

  def down
    drop_table :shipments
  end
end
