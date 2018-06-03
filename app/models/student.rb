class Student < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :active, inclusion: { in: [ true, false ] }
  before_validation :ensure_active_status
  before_destroy :ensure_no_awards

  has_many :awards

  private
  def ensure_active_status
    if self.active.nil?
      self.active = true
    end
  end

  def ensure_no_awards
    if awards.any?
      errors[:base] << "Cannot delete student with existing awards."
      throw :abort
    end
  end
end
