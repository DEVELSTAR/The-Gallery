class PostsController < ApplicationController
    before_action :authenticate_user!
    
	def show
		@post = Post.find(params[:id])
    	@comments = @post.comments.order(created_at: :desc)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		redirect_to root_path
	end

	private

	def post_params
	  params.require(:post).permit(:title, :image, :user_id, :comment_id)
	end
end
