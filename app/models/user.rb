class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: /[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}/
                    }

  has_many :events
  before_save :email_downcase

  def email_downcase
    self.email = email.downcase
  end
end
