class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.float :total_price
      t.date :completed_date
      t.string :state
      t.references :credit_card, index: true
      t.references :orders, index: true
      t.references :billing_address, index: true
      t.references :shipping_address, index: true
      
      t.timestamps
    end
  end
  def down
      drop_table :orders
  end
end
