class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.references :credit_card, index: true
      t.references :order, index: true	
      t.timestamps
    end
  end
  def down
    drop_table :customers
  end
end
