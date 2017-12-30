class AddLastNameToStudents < ActiveRecord::Migration[5.1]
  def change
    rename_column :students, :name, :first_name
    add_column :students, :last_name, :string
  end
end