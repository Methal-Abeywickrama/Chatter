class FollowsController < ApplicationController
  

  def create  
    @followee = Profile.find(params[:followee_id])
    @follower = current_user.profile
     if @follower.followees.include?(@followee)
        flash[:notice] = "You are already following this user"
     else 
        @follower.followee_relationships.create!(followee: @followee)
        flash[:notice] = "You are currently following this user"
        redirect_to profiles_path
     end
  end

  def destroy
    puts 'params are '
    p params
    @followee = Profile.find(params[:followee_id])
    p @followee
    @follower = current_user.profile
    if @follower.followees.include?(@followee)
      @follower.followee_relationships.find_by(followee: @followee).destroy!
      flash[:notice] = "You have stopped following this user"
      redirect_to profiles_path
    else 
      flash[:notice] = "You are not following this user"
      redirect_to profiles_path
    end

  end
end
