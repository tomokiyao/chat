class CreatePostBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :post_books do |t|
      t.text :book_name
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
