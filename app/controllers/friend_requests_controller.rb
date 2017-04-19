class FriendRequestsController < ApplicationController

  def create
    #first_instance
    @receiver_user_id = Profile.find(params[:id]).user.id
    @request = FriendRequest.new
    @request.sender_id = current_user.id
    @request.receiver_id = @receiver_user_id
    @request.status = "pending"
    @request.save
    flash[:request_notice] = "Friend request sent!"
    redirect_to profile_path(current_user.profile)
  end

  def show
    @friend_requests = current_user.friend_requests
  end

  def destroy
    @first_request = FriendRequest.find(params[:id])
    @my_id = @first_request.receiver_id
    @sender_id = @first_request.sender_id
    @second_request = FriendRequest.where(receiver_id:@sender_id , sender_id: @my_id)[0]
    FriendRequest.destroy(@first_request)
    FriendRequest.destroy(@second_request)
    flash[:decline_notice] = "Request declined. Womp womp."
    redirect_to profile_path(current_user.profile)
  end

  def fr_params
    params.require(:friend_request).permit(:sender_id, :receiver_id, :status)
  end
end
