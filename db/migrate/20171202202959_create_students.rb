class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.boolean :current, null: false

      t.timestamps
    end
  end
end
