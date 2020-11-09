class Username < ApplicationRecord
    has_many :userscores
    has_many :scores, through: :userscores

    has_secure_password
    validates :name, 
        presence: true,
        length: { minimum: 3 }
    validates :password, 
        presence: true,
        length: { in: 6..20 }
    validates :email, 
        presence: true,
        format: { with: URI::MailTo::EMAIL_REGEXP } 
end
