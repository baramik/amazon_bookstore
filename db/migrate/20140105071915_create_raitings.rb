class CreateRaitings < ActiveRecord::Migration
  def up
    create_table :raitings do |t|
      t.text :review
      t.integer :raiting_number
      t.references :book, index: true	
      t.references :customer, index: true
      t.timestamps
    end
  end
  def down
  	drop_table :raitings
  end
end
