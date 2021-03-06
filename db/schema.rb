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

ActiveRecord::Schema.define(version: 20150417152339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bet_choices", force: :cascade do |t|
    t.string   "label",      null: false
    t.integer  "type_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bet_types", force: :cascade do |t|
    t.string   "label",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
  end

  add_index "bet_types", ["label"], name: "index_bet_types_on_label", unique: true, using: :btree

  create_table "bets", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "type_id",    null: false
    t.integer  "choice_id",  null: false
    t.integer  "match_id"
    t.integer  "amount",     null: false
    t.boolean  "won"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "odds",       null: false
  end

  add_index "bets", ["user_id", "type_id", "match_id"], name: "index_bets_on_user_id_and_type_id_and_match_id", unique: true, using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "winner_id"
    t.integer  "dragons_id"
    t.integer  "barons_id"
    t.integer  "killing_spree_id"
    t.integer  "multi_kill_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "balance"
    t.datetime "last_refill",                    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "lang",            default: "en", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["login"], name: "index_users_on_login", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree

end
