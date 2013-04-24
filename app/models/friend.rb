class Friend < ActiveRecord::Base
  attr_accessible :name, :fb_id

  has_many :user_friends
  has_many :users, :through => :user_friends
end
