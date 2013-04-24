class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :email, :digest_frequency, :oauth_token, :oauth_expires_at, :friends_attributes, :user_friends_attributes

  has_many :user_friends
  has_many :friends, :through => :user_friends

  accepts_nested_attributes_for :friends, :user_friends

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
      user.get_facebook_friends
      # binding.pry
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def get_facebook_friends
    self.facebook.get_connection("me", "friends").each do |facebook_friend_data|
      friend = Friend.new
      friend.name = facebook_friend_data["name"]
      friend.fb_id = facebook_friend_data["id"]
      friend.photo = "https://graph.facebook.com/#{friend.fb_id}/picture?width=100&height=100" 
      friend.save
      self.friends << friend
    end
  end


end
