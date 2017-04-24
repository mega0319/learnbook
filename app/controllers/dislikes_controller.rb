class DislikesController < ApplicationController

  def create
    dislike = Dislike.new
    dislike.user_id = current_user.id
    dislike.post_id = params[:post_id]
    if dislike.save
      redirect_to profile_path(params[:profile_id])
    else
      flash[:dislike_msg] = "You already disliked this post! Chill with the haterade."
      redirect_to profile_path(params[:profile_id])
    end
  end

  def dislike_params
    params.require(:dislike).permit(:user_id, :post_id)
  end

end
