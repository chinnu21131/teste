# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_07_043432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "menu_item_id"
    t.string "cart_item"
    t.integer "cart_item_price"
    t.integer "item_quantity"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "menu_item"
    t.string "description"
    t.integer "price"
    t.bigint "menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "menu_name"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "menu_item_id"
    t.string "menu_item_name"
    t.integer "menu_item_price"
    t.integer "quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.date "order_date"
    t.integer "amount"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
