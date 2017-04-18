class ProfilesController < ApplicationController

  def index
  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = session[:user_id]
    @profile.save
    redirect_to profile_path(@profile)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :occupation, :birthdate, :location, :favorite_quote, :email, :phone_number, :about_me, :facebook, :instagram, :twitter, :linkedin, :slack, :learnco, :github, :cohort_name, :cohort_date, :user_id)
  end

end
