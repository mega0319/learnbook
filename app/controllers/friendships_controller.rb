class FriendshipsController < ApplicationController
helper_method :find_profile

  def index
    @users = User.all
  end

  def create
    @request_update = FriendRequest.find_by_sender_id_and_receiver_id(params[:user_id], current_user.id)
    @request_update.update(status: "accepted")
    @request_update.save
    @new_friendship = Friendship.new
    @new_friendship.user_id = current_user.id
    @new_friendship.friend_id = params[:user_id]
    @new_friendship.save

    redirect_to profile_path(current_user.profile)
  end

  def search
    if params[:first_name].present? && params[:last_name].blank?
      @user = User.where(first_name: params[:first_name].capitalize)
    elsif params[:first_name].blank? && params[:last_name].present?
      @user = User.where(last_name: params[:last_name].capitalize)
    elsif params[:first_name].present? && params[:last_name].present?
      @user = User.where(first_name: params[:first_name].capitalize, last_name: params[:last_name].capitalize)
    end
    unless @user.present?
      flash[:message] = "No users found"
    else
      render :search
    end
  end

  def find_profile
    Profile.find_by(user_id: current_user.id)
  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end

end
