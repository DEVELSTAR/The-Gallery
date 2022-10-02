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

	def destroy
	  @post = current_user.posts.find(params[:id])
	  @post.destroy
	  redirect_to request.referrer
	end

	def update
	  @post = Post.find(params[:id])
	  if @post.update(post_params)
	    redirect_to root_path
	    flash[:notice] = 'post was updated.'
	  else
	    render 'edit'
	  end
    end    

    def edit
      @post = Post.find(params[:id])
    end

	private

	def post_params
	  params.require(:post).permit(:title, :image, :user_id, :comment_id)
	end
end
