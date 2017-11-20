class Lesson < ApplicationRecord
  validates :duration, :price, presence: true
  validates :duration, uniqueness: true
end
