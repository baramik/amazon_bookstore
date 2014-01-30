class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end
  def down
  	drop_table :categories
  end	
  
  end
end
