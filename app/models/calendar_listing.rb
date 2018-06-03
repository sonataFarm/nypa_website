class CalendarListing < ApplicationRecord
  validates :description, :start_date, :semester_id,
    presence: true

  belongs_to :semester
end
