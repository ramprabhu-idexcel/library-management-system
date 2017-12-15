class Book < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :number, presence: true, length: { maximum: 10 }
  validates :author, presence: true, length: { maximum: 50 }
  has_many :users, through: :user_books, dependent: :destroy
  default_scope { order('created_at DESC') }

  def self.search(search)
    if search
      where("name LIKE ? OR number LIKE ? OR author LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
