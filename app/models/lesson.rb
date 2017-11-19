class Lesson < ApplicationRecord
  validates :duration, :price, presence: true
end
