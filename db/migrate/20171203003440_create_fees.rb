class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.string :name, null: false
      t.integer :amount, null: false

      t.timestamps
    end

    add_index :fees, :name, unique: true
  end
end
