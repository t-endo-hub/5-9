class RelationshipsController < ApplicationController

  before_action :set_user, only: [:create, :destroy]

  def create
    following = current_user.follow(@user)
    if following.save
      redirect_back(fallback_location: root_path) 
    else
      redirect_back(fallback_location: root_path) 
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_back(fallback_location: root_path) 
    else
      redirect_back(fallback_location: root_path) 
    end
  end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end
end
