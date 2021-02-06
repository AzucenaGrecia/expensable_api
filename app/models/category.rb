class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  enum transaction_type: { income: 'income', expense: 'expense' }
  validates :name, presence: true
end
