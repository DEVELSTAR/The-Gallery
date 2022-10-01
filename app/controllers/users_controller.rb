class UsersController < ApplicationController

	def index
      @users = User.all
	end

	def show
	  @user = User.find(params[:id])
	  @posts = @user.posts.order(created_at: :desc)
	end

	def edit
	  @user = User.find(params[:id])
	end

	def update
	  current_user.update(user_params)
	  redirect_to current_user
	end

	private

	def user_params
	  params.require(:user).permit(:username, :name, :website, :bio, :email, :avatar)
	end
end