class Book < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :number, presence: true, length: { maximum: 10 }
  validates :author, presence: true, length: { maximum: 50 }
  has_many :users, through: :user_books, dependent: :destroy
end
