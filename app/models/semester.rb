class Semester < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :calendar_dates
end
