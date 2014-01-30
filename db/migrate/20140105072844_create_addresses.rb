class CreateAddresses < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.string :address
      t.integer :zipcode
      t.string :city
      t.string :phone
      t.string :country
      t.references :country, index: true
      t.timestamps
    end
  end
  
  def down
    drop_table :adresses
  end
end
