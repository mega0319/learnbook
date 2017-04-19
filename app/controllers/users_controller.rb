class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @profile = Profile.new
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Registration Successful!"
      @profile.user_id = @user.id
      @profile.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.find(current_user.profile)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :birthday, :email)
  end






end
