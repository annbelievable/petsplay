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

ActiveRecord::Schema.define(version: 20170410062730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favourites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pet_id"
    t.index ["pet_id"], name: "index_favourites_on_pet_id", using: :btree
    t.index ["user_id"], name: "index_favourites_on_user_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "borrower_id"
    t.boolean "match"
    t.index ["borrower_id"], name: "index_matches_on_borrower_id", using: :btree
    t.index ["owner_id"], name: "index_matches_on_owner_id", using: :btree
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "types"
    t.text     "description"
    t.integer  "age"
    t.string   "gender"
    t.string   "breed"
    t.json     "photos"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.json     "available_days",  default: []
    t.json     "available_times", default: []
    t.index ["user_id"], name: "index_pets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number"
    t.string   "address"
    t.integer  "postcode"
    t.string   "city"
    t.string   "state"
    t.string   "photo"
    t.boolean  "verified",               default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "favourites", "pets"
  add_foreign_key "favourites", "users"
  add_foreign_key "matches", "users", column: "borrower_id"
  add_foreign_key "matches", "users", column: "owner_id"
  add_foreign_key "pets", "users"
end
