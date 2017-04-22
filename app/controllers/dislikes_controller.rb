class DislikesController < ApplicationController

  def create
    dislike = Dislike.new
    dislike.user_id = current_user.id
    dislike.post_id = params[:post_id]
    dislike.save
    redirect_to posts_path
  end

  def dislike_params
    params.require(:dislike).permit(:user_id, :post_id)
  end

end
