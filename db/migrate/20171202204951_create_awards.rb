class CreateAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :awards do |t|
      t.integer :student_id, null: false
      t.string :competition, null: false
      t.string :placement, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
