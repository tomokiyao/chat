class AddLikesCountToPostBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :post_books, :likes_count, :integer
  end
end
