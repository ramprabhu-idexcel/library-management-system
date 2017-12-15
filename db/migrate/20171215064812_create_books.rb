class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :number
      t.string :author

      t.timestamps
    end
  end
end
