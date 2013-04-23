class Friend < ActiveRecord::Base
  attr_accessible :name, :fb_id

  has_and_belongs_to_many :users
end
