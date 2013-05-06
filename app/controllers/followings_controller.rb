class FollowingsController < ApplicationController

  def new
    @following = Following.new
  end

  # def create
  #   binding.pry
  #   params[:friend_id].each do |key, value|
  #     if value == "1"
  #       @following = Following.new
  #       @following.user = current_user
  #       @following.friend = Friend.find_by_id("#{key}")
  #       @following.save
  #     end
  #   end
  #   redirect_to followings_path
  # end

  def create
    @following = Following.new
    @following.user = current_user
    @following.friend = Friend.find_by_id(params[:friend_id])
    @following.save
    redirect_to user_path(current_user)
  end

  def destroy
    Following.where(:friend_id => params[:friend_id], :user_id => current_user.id).first.destroy
    redirect_to user_path(current_user)
  end

end
