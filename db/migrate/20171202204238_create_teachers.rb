class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.text :bio
      t.string :img_url

      t.timestamps
    end
  end
end
