class Recipe < ApplicationRecord
    has_many :ingredients
    has_many :products, through: :ingredients
    validates :title, presence: true
    validates :body, presence: true
end
