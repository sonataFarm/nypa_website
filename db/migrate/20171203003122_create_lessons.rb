class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :duration, null: false
      t.integer :price, null: false

      t.timestamps
    end

    add_index :lessons, :duration, unique: true
  end
end
