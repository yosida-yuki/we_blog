class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.includes(:user)
  end
  def create
    Post.create(post_params)
    redirect_to root_path
  end
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end