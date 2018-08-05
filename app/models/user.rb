class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         attachment :profile_image

         has_many :post_books

         has_many :post_comments, dependent: :destroy

         has_many :favorites, dependent: :destroy

         has_many :active_relationships,class_name: "Relationship", foreign_key: :following_id, dependent: :destroy

         has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy

         has_many :followings, through: :active_relationships, source: :follower

         has_many :followers, through: :passive_relationships, source: :following

         # def follow(other_user)
         # 	active_relationships.create(following_id: other_user.id)
         # end

         # def unfollow(other_user)
         # 	active_relationships.find_by(following_id: other_user.id).destroy
         # end

         # def following?(other_user)
         # 	following.include?(other_user)
         # end
         def self.search(search)
         	if search !=''#ある時
         		if User.where("(name = ?) OR (introduction = ?)", "#{search}", "#{search}").empty?
         			@users = User.all
         		else
         			# @users = User.where(['introduction LIKE ?', "%#{search}%"] && ['name LIKE ?', "%#{search}%"] )
         			@users = User.where("(name = ?) OR (introduction = ?)", "#{search}", "#{search}")
         		end
         else
         	@users = User.all
         end
     end

         def following_by?(user)
         	passive_relationships.find_by(following_id: user.id).present?
         end
end
