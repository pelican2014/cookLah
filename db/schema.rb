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

ActiveRecord::Schema.define(version: 20170504162348) do

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "price"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "price"
    t.decimal  "interval"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "recipe_code"
    t.text     "ingredients_info"
    t.text     "equipment_info"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "status"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "views",               default: 0, null: false
    t.text     "ingredients"
    t.text     "equipment"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "instructions"
    t.string   "symbol"
    t.string   "dietary_restriction"
    t.string   "cooking_time"
    t.string   "level_of_difficulty"
    t.decimal  "price"
    t.integer  "pax"
    t.string   "region"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
