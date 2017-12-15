class UserBook < ApplicationRecord
  MAX_BOOK_PER_USER = 5
  validate :allow_five_book_per_user
  belongs_to :user
  belongs_to :book

  def allow_five_book_per_user
    user = User.find(user_id)
    if user.books.size == MAX_BOOK_PER_USER
      errors.add(:book_id, "Only #{MAX_BOOK_PER_USER} books allowed per user")
    end
  end
end
