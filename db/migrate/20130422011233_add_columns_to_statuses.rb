class AddColumnsToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :friend_id, :integer
    add_column :statuses, :status_type, :string
    add_column :statuses, :fb_link, :string
    add_column :statuses, :status_created_time, :datetime
    add_column :statuses, :status_updated_time, :datetime
    add_column :statuses, :external_link, :string
    add_column :statuses, :image, :string
  end
end
