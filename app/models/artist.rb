class Artist < ApplicationRecord
  include ValidatableEnum

  validates :name, presence: { message: 'Name cannot be empty' }, length: { maximum: 100, message: 'Name cannot exceed 100 characters' }

  enum category: %w[band duo singer]
  validatable_enum :category
  validates :category, inclusion: { in: categories.keys, message: "%{value} is not a valid category. Category must be one of #{categories.keys}" }
  
  validates :debut_year, presence: { message: 'Debut year cannot be empty' }
end
