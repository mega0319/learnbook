class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    flash[:post_success] = "Post is Great success!"
    redirect_to user_path(current_user)
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to profile_path(current_user.profile)
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to profile_path(current_user.profile)
  end

end
