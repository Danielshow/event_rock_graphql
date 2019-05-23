class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true,
                    uniqueness: true

  has_many :events
  before_save :email_downcase

  def email_downcase
    self.email = email.downcase
  end

  def generate_password_reset_token!
    update_attribute(:password_reset_token, SecureRandom.urlsafe_base64)
  end
end
