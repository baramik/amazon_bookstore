class CreateOrderItems < ActiveRecord::Migration
  def up
    create_table :order_items do |t|
      t.float :price
      t.integer :quiantity
      t.references :order, index: true
      t.references :book, index: true
      
      t.timestamps
    end 
  end
  def down
	drop_table :order_items  		
  end
end
