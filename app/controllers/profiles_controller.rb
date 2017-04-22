class ProfilesController < ApplicationController

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    @profile.save
    redirect_to profile_path(@profile)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(current_user.profile)
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :occupation, :birthdate, :location, :favorite_quote, :email, :phone_number, :about_me, :facebook, :instagram, :twitter, :linkedin, :slack, :learnco, :github, :cohort_name, :cohort_date, :user_id)
  end

end
