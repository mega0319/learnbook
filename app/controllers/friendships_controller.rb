class FriendshipsController < ApplicationController
helper_method :find_profile

  def index
    @users = User.all
  end

  def create
    friend_id = User.find(params[:format]).id
      new_friendship = Friendship.new(user_id: current_user.id, friend_id: friend_id)
      second_friendship = Friendship.new(user_id: friend_id, friend_id: current_user.id)
      new_friendship.save
      second_friendship.save
      update_request = FriendRequest.find_by(sender_id: friend_id, receiver_id: current_user.id )
      update_request.status = "accepted"
      update_request.save
      redirect_to friendships_path
  end

  def search
    if params[:first_name].present? && params[:last_name].blank?
      @user = User.where('first_name LIKE ?', "%#{params[:first_name].capitalize}%")
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

  def destroy
    friend = Profile.find(params[:id]).user
    friendship1 = Friendship.find_by(user_id:current_user.id, friend_id:friend.id)
    friendship2 = Friendship.find_by(user_id:friend.id, friend_id:current_user.id)
    friendship1.destroy
    friendship2.destroy
    flash[:unfriend_msg] = "You unfriended #{friend.first_name}"
    redirect_to profile_path(params[:id])
  end

  def find_profile
    Profile.find_by(user_id: current_user.id)
  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :id)
  end

end
