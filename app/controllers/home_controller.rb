class HomeController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
    @user = User.all
  end
end
