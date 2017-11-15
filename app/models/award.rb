class Award < ApplicationRecord
  validates :student_id, :competition, :placement, :date, presence: true

  belongs_to :student
end
