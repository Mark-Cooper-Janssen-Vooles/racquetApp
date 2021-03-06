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

ActiveRecord::Schema.define(version: 2019_11_06_060324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "racquet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["racquet_id"], name: "index_favourites_on_racquet_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "state"
    t.string "suburb"
    t.string "address_line"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_detail_id"
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["user_detail_id"], name: "index_locations_on_user_detail_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "racquets", force: :cascade do |t|
    t.text "description"
    t.string "head_size"
    t.string "length"
    t.string "strung_weight"
    t.string "balance"
    t.string "stiffness"
    t.string "string_pattern"
    t.string "brand"
    t.integer "racquet_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "seller_user_id"
    t.string "title"
    t.float "price"
    t.index ["seller_user_id"], name: "index_racquets_on_seller_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.boolean "sold"
    t.date "date_sold"
    t.integer "view_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "racquet_id"
    t.bigint "user_id"
    t.index ["racquet_id"], name: "index_statuses_on_racquet_id"
    t.index ["user_id"], name: "index_statuses_on_user_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favourites", "racquets"
  add_foreign_key "favourites", "users"
  add_foreign_key "locations", "user_details"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "racquets", "users", column: "seller_user_id"
  add_foreign_key "statuses", "racquets"
  add_foreign_key "statuses", "users"
  add_foreign_key "user_details", "users"
end
