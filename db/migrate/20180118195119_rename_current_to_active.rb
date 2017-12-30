class RenameCurrentToActive < ActiveRecord::Migration[5.1]
  def change
    rename_column :students, :current, :active
    change_column_null :students, :last_name, false
  end
end
