class LikesController < ApplicationController

  def create
    like = Like.new
    like.user_id = current_user.id
    like.post_id = params[:post_id]
    like.save
    redirect_to profile_path(params[:profile_id])
  end

  def likes_params
    params.require(:like).permit(:user_id, :post_id)
  end

end
