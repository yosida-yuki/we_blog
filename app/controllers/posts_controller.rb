class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user)  
  end

  def new
    @post = Post.new
  end

  def create
    binding.pry
    Post.create(post_params)
    redirect_to root_path
  end

# 中略

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

end