class Favorite < ApplicationRecord

	belongs_to :user
	belongs_to :post_book, counter_cache: :likes_count
end


