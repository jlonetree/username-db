class Score < ApplicationRecord
    has_many :userscores
    has_many :users, through: :userscores
end
