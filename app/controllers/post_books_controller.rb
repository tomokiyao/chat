class PostBooksController < ApplicationController
  def index
  	@post_books = PostBook.page(params[:page]).reverse_order.search(params[:search])
    # @post_books = PostBook.all
  	@post_book = PostBook.new
  	@user = current_user
  	@users = User.all
  end

  def show
  	@post_book = PostBook.find(params[:id])
  	@post_books = PostBook.all
  	@book_new = PostBook.new
  	@users = User.all
  	@user = current_user
  	@post_comment = PostComment.new
  end

  def new
  	@post_book = PostBook.new
  end

  def create
  	@post_book = PostBook.new(post_book_params)
  	@post_book.user_id = current_user.id
  	if @post_book.save
  		redirect_to post_book_path(@post_book.id)
  	else
  		redirect_to post_books_path
  	end
  end

  def edit
  	@post_book = PostBook.find(params[:id])
  	@post_books = PostBook.all
  	@users = User.all
  end

  def update
  	post_book = PostBook.find(params[:id])
  	post_book.update(post_book_params)
  	redirect_to post_book_path
  end

  def destroy
  	post_book = PostBook.find(params[:id])
  	post_book.destroy
  	redirect_to post_books_path
  end

  private

  def post_book_params
  	params.require(:post_book).permit(:book_name, :caption, :user_id)
  end
end
