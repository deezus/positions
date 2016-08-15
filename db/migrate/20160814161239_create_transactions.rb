class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :trader, foreign_key: true
      t.references :action, foreign_key: true
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
