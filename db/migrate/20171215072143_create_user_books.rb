class CreateUserBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :start_date
      t.datetime :return_date
      t.boolean :is_damage

      t.timestamps
    end
    add_index :user_books, :user_id
    add_index :user_books, :book_id
  end
end
