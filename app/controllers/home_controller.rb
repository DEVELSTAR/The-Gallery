class HomeController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
    @pagy, @posts = pagy(Post.order(created_at: :desc), items: 1)

    @user = User.all
    @my_account = current_user

  end
end
