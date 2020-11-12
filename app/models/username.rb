class Username < ApplicationRecord
  has_many :userscores
  has_many :scores, through: :userscores

  has_secure_password
  validates :name,
            presence: true,
            length: { minimum: 3 },
            uniqueness: { case_sensitive: false }
  validates :password_digest,
            presence: true,
            length: { in: 6..20 }
  validates :email,
            presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

end
