class User < ApplicationRecord
  default_scope { order('created_at DESC') }
  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { minimum: 10 }, uniqueness: true
  has_many :user_books
  has_many :books, through: :user_books, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end

  def self.search(search)
    if search
      where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR phone LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
