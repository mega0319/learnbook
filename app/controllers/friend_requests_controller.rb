class FriendRequestsController < ApplicationController


  def create
    @receiver_id = Profile.find(params[:id]).user.id
    @new_request = FriendRequest.new
    @new_request.sender_id = current_user.id
    @new_request.receiver_id = @receiver_id
    @new_request.status = "pending"
    @new_request.save
    flash[:request_notice] = "Friend request sent!"
    redirect_to profile_path(current_user.profile)
  end

  def show
    @friend_requests = FriendRequest.all
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    FriendRequest.delete(@friend_request.id)
    flash[:delete_notice] = "Friend request declined. Womp womp..."
    render :show
  end

  def fr_params
    params.require(:friend_request).permit(:sender_id, :receiver_id, :status)
  end

  private


end
