class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).reverse_order.search(params[:search])

    # @books 
  	@user = current_user
  	@post_book = PostBook.new
  	@post_books = PostBook.all

  end

  def show
  	@user = User.find(params[:id])
  	@users = User.all
  	@post_book = PostBook.new
  	@post_books = @user.post_books
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  def following
      @user  = User.find(params[:id])
      @following = @user.followings
  end

  def followers
    @user  = User.find(params[:id])
    @followers = @user.followers
  end


	private
	def user_params
		params.require(:user).permit(:email, :name, :profile_image, :introduction)
	end
end


