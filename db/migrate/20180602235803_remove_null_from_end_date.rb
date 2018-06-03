class RemoveNullFromEndDate < ActiveRecord::Migration[5.1]
  def change
    change_column :calendar_listings, :end_date, :string, null: true
  end
end
