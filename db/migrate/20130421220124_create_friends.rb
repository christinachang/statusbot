class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :fb_id
      t.string :relationship_status
      t.date :birthday
      t.boolean :follow?
      t.timestamps
    end
  end
end
