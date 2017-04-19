class SessionsController < ApplicationController

  def new
    if current_user
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.present? && @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Username and/or Password was incorrect. Please try again."
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end

end
