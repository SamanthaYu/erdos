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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161204030142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.string   "roomname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.string   "poster"
    t.integer  "chatroom_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.string   "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "private_chats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chatroom_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.string   "username"
    t.integer  "type"
    t.string   "userType"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "avatar"
    t.boolean  "requesting_admin"
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
