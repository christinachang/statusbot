class AddColumnsToFriendTable < ActiveRecord::Migration
  def change
    add_column :friends, :name, :string
    add_column :friends, :photo, :string
  end
end
