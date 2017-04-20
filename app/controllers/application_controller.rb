class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :authorize, :current_user, :check_pending_requests

  def authorize
    unless logged_in?
      flash[:message] = "Whoops, you need to log in to do that!"
      redirect_to new_session_path
    end
  end

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def check_pending_requests
    @all = FriendRequest.all
    @all.each do |req|
      if req.receiver_id == current_user.id
        return true
      else
        false
      end
    end
  end



end
