class CreateCalendarDates < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_dates do |t|
      t.string :description, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :semester_id, null: false

      t.timestamps
    end
  end
end
