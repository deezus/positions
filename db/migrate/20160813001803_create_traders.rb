class CreateTraders < ActiveRecord::Migration[5.0]
  def change
    create_table :traders do |t|
      t.string :firstname
      t.string :lastname
      t.integer :value

      t.timestamps
    end
  end
end
