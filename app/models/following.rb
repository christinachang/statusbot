class Following < ActiveRecord::Base
  attr_accessible :follower_id, :followed_friend_id

  belongs_to :user
  belongs_to :friend
end
