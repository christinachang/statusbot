class UserFriend < ActiveRecord::Base
  attr_accessible :user_id, :friend_id, :followflat

  belongs_to :user
  belongs_to :friend

end
