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

ActiveRecord::Schema.define(version: 20150404183312) do

  create_table "bet_choices", force: :cascade do |t|
    t.string   "label",                   null: false
    t.integer  "amount",     default: 10
    t.integer  "type_id",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "bet_types", force: :cascade do |t|
    t.string   "label",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bet_types", ["label"], name: "index_bet_types_on_label", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "balance"
    t.datetime "last_refill",     null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["login"], name: "index_users_on_login", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
