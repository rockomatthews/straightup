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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170707012340) do

  create_table "challenges", force: :cascade do |t|
    t.string   "title"
    t.string   "event"
    t.text     "rules"
    t.integer  "bet_amount"
    t.boolean  "challenge_accepted?"
    t.boolean  "challenge_complete?"
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.integer  "moderator_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "challenges", ["moderator_id"], name: "index_challenges_on_moderator_id"
  add_index "challenges", ["user1_id"], name: "index_challenges_on_user1_id"
  add_index "challenges", ["user2_id"], name: "index_challenges_on_user2_id"

  create_table "friendships", force: :cascade do |t|
    t.integer  "friendable_id"
    t.string   "friendable_type"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id"
    t.integer  "status"
  end

  create_table "gamerooms", force: :cascade do |t|
    t.integer  "money"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "challenge_id"
  end

  add_index "gamerooms", ["challenge_id"], name: "index_gamerooms_on_challenge_id"

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gameroom_id"
  end

  add_index "messages", ["gameroom_id"], name: "index_messages_on_gameroom_id"
  add_index "messages", ["user1_id"], name: "index_messages_on_user1_id"
  add_index "messages", ["user2_id"], name: "index_messages_on_user2_id"

  create_table "moderators", force: :cascade do |t|
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "motto"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "wallet_id"
    t.integer  "wins"
    t.integer  "losses"
    t.string   "username"
  end

  add_index "users", ["wallet_id"], name: "index_users_on_wallet_id"

  create_table "wallets", force: :cascade do |t|
    t.integer  "money"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id"

end
