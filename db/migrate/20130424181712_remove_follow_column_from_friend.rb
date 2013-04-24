class RemoveFollowColumnFromFriend < ActiveRecord::Migration
  def change
    remove_column :friends, :follow
    add_column :user_friends, :follow, :boolean
  end
end
