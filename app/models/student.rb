class Student < ApplicationRecord
  validates :name, :current, presence: true

  has_many :awards
end
