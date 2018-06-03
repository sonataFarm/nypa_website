class RenameCalendarDate < ActiveRecord::Migration[5.1]
  def change
    rename_table :calendar_dates, :calendar_listings
  end
end
