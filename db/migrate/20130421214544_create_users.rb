class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :fb_id
      t.string :access_token
      t.datetime :token_expiration
      t.string :email
      t.string :digest_frequency
      t.timestamps
    end
  end
end
