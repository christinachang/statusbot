class RemoveFollowColumnFromUserFriend < ActiveRecord::Migration
  def change
    remove_column :user_friends, :follow
  end
end
