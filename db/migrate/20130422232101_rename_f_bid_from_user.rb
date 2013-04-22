class RenameFBidFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :fb_id
    add_column :users, :uid, :integer
  end
end
