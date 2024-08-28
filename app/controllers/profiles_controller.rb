class ProfilesController < ApplicationController
  before_action :check_if_exists, only: [:show]

  def show
    @profile = current_user.profile
  end

  def new 
    @profile = Profile.new
  end

  def edit
    @profile = current_user.profile
  end

  def update
    if current_user.profile.update(profile_params)
      redirect_to profile_path, notice: "Profile edited successfully"
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save! 
      redirect_to profile_path, notice: "Profile created successfully"
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def check_if_exists
    puts 'hi there'
    return if  current_user.profile.present?

    redirect_to new_profile_path
  end

  def profile_params 
    params.require(:profile).permit(:name, :description)
  end
end
