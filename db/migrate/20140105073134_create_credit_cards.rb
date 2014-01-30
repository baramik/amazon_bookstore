class CreateCreditCards < ActiveRecord::Migration
  def up
    create_table :credit_cards do |t|
      t.integer :number
      t.integer :CVV
      t.integer :expiration_month
      t.integer :expiration_year
      t.string :first_name
      t.string :last_name
      t.references :customer, index: true

      t.timestamps
    end
  end
  def down
    drop_table :credit_cards
  end
end
