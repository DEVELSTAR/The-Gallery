class UsersController < ApplicationController

	def index
      @users = User.all
	end

	def show
	  @user = User.find(params[:id])
	  @posts = @user.posts.order(created_at: :desc)
	end



   private

	def user_params
	  params.require(:user).permit(:email)
	end
end