class Review < ApplicationRecord
  belongs_to :cocktail
  validates :stars, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
end
