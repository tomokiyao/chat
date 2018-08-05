class PostCommentsController < ApplicationController

def create
    post_book = PostBook.find(params[:post_book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_book_id = post_book.id
    comment.save
    redirect_to post_book_path(post_book)
end
private
	def post_comment_params
	  params.require(:post_comment).permit(:user_id,
	                      :post_book_id,
	                      :comment)
	end
end
