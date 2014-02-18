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

ActiveRecord::Schema.define(version: 20140218001109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.integer  "zipcode"
    t.string   "city"
    t.string   "phone"
    t.string   "country"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["order_id"], name: "index_addresses_on_order_id", using: :btree

  create_table "authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "biography"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.float    "price"
    t.integer  "books_in_stock"
    t.integer  "author_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", force: true do |t|
    t.string   "number"
    t.integer  "CVV"
    t.integer  "expiration_month"
    t.integer  "expiration_year"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "credit_cards", ["customer_id"], name: "index_credit_cards_on_customer_id", using: :btree
  add_index "credit_cards", ["order_id"], name: "index_credit_cards_on_order_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "credit_card_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
  end

  add_index "customers", ["credit_card_id"], name: "index_customers_on_credit_card_id", using: :btree
  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["order_id"], name: "index_customers_on_order_id", using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "order_items", force: true do |t|
    t.float    "price"
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["book_id"], name: "index_order_items_on_book_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.float    "total_price"
    t.datetime "completed_date"
    t.string   "state"
    t.integer  "credit_card_id"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  add_index "orders", ["billing_address_id"], name: "index_orders_on_billing_address_id", using: :btree
  add_index "orders", ["credit_card_id"], name: "index_orders_on_credit_card_id", using: :btree
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["shipping_address_id"], name: "index_orders_on_shipping_address_id", using: :btree

  create_table "raitings", force: true do |t|
    t.text     "review"
    t.integer  "raiting_number"
    t.integer  "book_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status"
  end

  add_index "raitings", ["book_id"], name: "index_raitings_on_book_id", using: :btree
  add_index "raitings", ["customer_id"], name: "index_raitings_on_customer_id", using: :btree

  create_table "shipments", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "shipments", ["order_id"], name: "index_shipments_on_order_id", using: :btree

end
