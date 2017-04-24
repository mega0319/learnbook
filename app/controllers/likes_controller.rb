class LikesController < ApplicationController

  def create
    like = Like.new
    like.user_id = current_user.id
    like.post_id = params[:post_id]
    if like.save
      redirect_to profile_path(params[:profile_id])
    else
      flash[:like_msg] = "You already liked this post!"
      redirect_to profile_path(params[:profile_id])
    end
  end

  def likes_params
    params.require(:like).permit(:user_id, :post_id)
  end

end
