class Transaction < ApplicationRecord
  belongs_to :category

  validates :amount, numericality: {
    greater_than_or_equal_to: 0
  }
end
