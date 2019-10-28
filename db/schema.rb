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

ActiveRecord::Schema.define(version: 2019_10_28_012529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "state"
    t.string "suburb"
    t.string "address_line"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_detail_id"
    t.index ["user_detail_id"], name: "index_locations_on_user_detail_id"
  end

  create_table "racquets", force: :cascade do |t|
    t.bigint "seller_user_id_id"
    t.bigint "status_id"
    t.text "description"
    t.string "head_size"
    t.string "length"
    t.string "strung_weight"
    t.string "balance"
    t.string "stiffness"
    t.string "string_pattern"
    t.integer "brand"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_user_id_id"], name: "index_racquets_on_seller_user_id_id"
    t.index ["status_id"], name: "index_racquets_on_status_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "racquet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["racquet_id"], name: "index_shopping_carts_on_racquet_id"
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.boolean "sold"
    t.date "date_sold"
    t.integer "view_count"
    t.bigint "buyer_user_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_user_id_id"], name: "index_statuses_on_buyer_user_id_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.integer "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "locations", "user_details"
  add_foreign_key "racquets", "statuses"
  add_foreign_key "racquets", "users", column: "seller_user_id_id"
  add_foreign_key "shopping_carts", "racquets"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "statuses", "users", column: "buyer_user_id_id"
  add_foreign_key "user_details", "users"
end
