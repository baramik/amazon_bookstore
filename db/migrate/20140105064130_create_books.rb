class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :books_in_stock
      t.references :author, index: true
      t.references :category, index: true
      t.timestamps
    end

  end
  def down
    drop_table :books  
  end
end
