json.extract! user_book, :id, :user_id, :book_id, :start_date, :datetime, :return_date, :datetime, :is_damage, :boolean, :created_at, :updated_at
json.url user_book_url(user_book, format: :json)
