class Admin < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }

  before_validation :generate_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    admin = Admin.find_by_username(username)
    admin && admin.is_password?(password) ? admin : nil
  end

  attr_reader :password

  def password=(password)
    @password = password
    @password_digest = BCrypt::Password.create(self.password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session ||= self.class.generate_session_token
  end
end
