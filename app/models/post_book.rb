class PostBook < ApplicationRecord

	belongs_to :user

	has_many :post_comments, dependent: :destroy

	has_many :favorites, dependent: :destroy

	def self.search(search)
		if search != ''
			if PostBook.where(['book_name LIKE ?', "%#{search}%"]).empty?
				@post_books = PostBook.all
			else
				@post_books =PostBook.where(['book_name LIKE ?', "%#{search}%"])
			end
		else
			@post_books = PostBook.all
		end
	end

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
