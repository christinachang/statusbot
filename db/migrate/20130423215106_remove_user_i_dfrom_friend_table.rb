class RemoveUserIDfromFriendTable < ActiveRecord::Migration
  def change
    remove_column :friends, :user_id
  end
end
