class Student < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :active, inclusion: { in: [ true, false ] }
  before_validation :ensure_active_status

  has_many :awards

  def ensure_active_status
    self.active ||= true
  end
end
