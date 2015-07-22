class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    # :user_id = @current_user.id
  end

  def create
    params[:post][:user_id] = @current_user.id
    @post = Post.create post_params
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id)
  end
end
