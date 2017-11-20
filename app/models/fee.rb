class Fee < ApplicationRecord
  validates :name, :amount, presence: true
  validates :name, uniqueness: true
end
