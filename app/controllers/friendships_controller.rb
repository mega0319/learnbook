class FriendshipsController < ApplicationController
helper_method :find_profile

  def index
    @users = User.all
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

end
