class User < ApplicationRecord
  has_many :categories, dependent: :destroy

  has_secure_password
  has_secure_token

  validates :email, presence: true, uniqueness: true

  def invalidate_token
    update(token: nil)
  end
end
