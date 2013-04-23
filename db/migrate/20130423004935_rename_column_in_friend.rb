class RenameColumnInFriend < ActiveRecord::Migration
  def change
    remove_column :friends, :follow?
    add_column :friends, :follow, :boolean
  end
end
