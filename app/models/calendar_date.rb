class CalendarDate < ApplicationRecord
  validates :description, :start_date, :end_date, :semester_id,
    presence: true

  belongs_to :semester
end
