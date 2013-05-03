class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :email, :digest_frequency, :oauth_token, :oauth_expires_at, :friends_attributes, :user_friends_attributes

  has_many :user_friends
  has_many :friends, :through => :user_friends

  has_many :followings
  has_many :followed_friends, :through => :followings, :class_name => "Friend", :foreign_key => :followed_friend_id, :source => :friend
  
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
      user.get_facebook_friends_info
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

  def get_facebook_friends_info
    # self.friends.each do |friend|
    #   data_hash = self.facebook.get_object(friend.fb_id, :fields => "relationship_status,birthday")
    #   friend.relationship_status = data_hash["relationship_status"]
    #   friend.birthday = data_hash["birthday"]
    #   friend.save
    # end
    friend_array = self.friends.collect {|friend| friend.fb_id}
    nested_hash = self.facebook.get_objects(friend_array, :fields => "relationship_status,birthday")
    
    nested_hash.each do |id, data_hash|
      friend = self.friends.find_by_fb_id(id.to_i)
      friend.relationship_status = data_hash["relationship_status"]
      friend.birthday = add_year(data_hash["birthday"])
      friend.save
    end
  end

  def add_year(date)
    unless date == nil
      dob_array = date.split("/")
      if dob_array.size == 2
        dob_array[2] = "1900"
        dob_array * "/"
      else
        date
      end
    end
  end


end
