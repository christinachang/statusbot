class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :email, :digest_frequency, :oauth_token, :oauth_expires_at

  has_and_belongs_to_many :friends

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
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def get_facebook_friends
    self.facebook.get_connection("me", "friends").each do |friend|
      @friend = Friend.new
      @friend.name = friend[:name]
      @friend.fb_id = friend[:id]
      @friend.save
    end
  end

end
