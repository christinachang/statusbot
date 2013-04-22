# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130422212257) do

  create_table "_friends_old_20130421", :force => true do |t|
    t.integer  "user_id"
    t.integer  "fb_id"
    t.string   "relationship_status"
    t.date     "birthday"
    t.boolean  "follow?"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "name"
    t.string   "photo"
  end

  create_table "friends", :force => true do |t|
    t.string   "name"
    t.integer  "fb_id"
    t.string   "photo"
    t.string   "relationship_status"
    t.date     "birthday"
    t.integer  "user_id"
    t.boolean  "follow?"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "statuses", :force => true do |t|
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "friend_id"
    t.string   "status_type"
    t.string   "fb_link"
    t.datetime "status_created_time"
    t.datetime "status_updated_time"
    t.string   "external_link"
    t.string   "image"
  end

  create_table "users", :force => true do |t|
    t.integer  "fb_id"
    t.string   "email"
    t.string   "digest_frequency"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "name"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  create_table "users_friends", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
