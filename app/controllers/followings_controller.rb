class FollowingsController < ApplicationController

  def new
    @following = Following.new
  end

  def create
    params[:friend_id].each do |key, value|
      if value == "1"
        @following = Following.new
        @following.user = current_user
        @following.friend = Friend.find_by_id("#{key}")
        @following.save
      end
    end
    redirect_to followings_path
  end

end
