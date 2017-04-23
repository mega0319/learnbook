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

ActiveRecord::Schema.define(version: 20170423193419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.text    "content"
  end

  create_table "dislikes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "message_content"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "occupation"
    t.string   "birthdate"
    t.string   "location"
    t.string   "favorite_quote"
    t.string   "email"
    t.string   "phone_number"
    t.string   "about_me"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "slack"
    t.string   "learnco"
    t.string   "github"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "cohort_name"
    t.string   "cohort_date"
    t.string   "pic"
  end

  create_table "received_messages", force: :cascade do |t|
    t.integer "user_received"
    t.integer "user_sent"
    t.integer "message_id"
    t.boolean "message_status", default: false
  end

  create_table "sent_messages", force: :cascade do |t|
    t.integer "user_sent"
    t.integer "user_received"
    t.integer "message_id"
    t.boolean "message_status", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.date     "birthday"
    t.string   "email"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

end
