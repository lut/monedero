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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140331232940) do

  create_table "cards", :force => true do |t|
    t.string   "name"
    t.string   "logo_thumbnail"
    t.string   "code_type"
    t.integer  "category_id"
    t.text     "conditions"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "logo_front"
    t.string   "logo_back"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "credits", :force => true do |t|
    t.integer  "amount"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "user_id"
    t.integer  "merchant_id"
    t.string   "credit_type"
    t.text     "assigned_by"
    t.integer  "purchase_amount"
    t.decimal  "convertion_rate", :precision => 2, :scale => 2
    t.date     "expires_on"
    t.boolean  "has_expired",                                   :default => false
  end

  create_table "memberships", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "memberships", ["name"], :name => "index_memberships_on_name"

  create_table "merchants", :force => true do |t|
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
    t.text     "name"
    t.decimal  "geolat"
    t.decimal  "geolon",                 :precision => 3, :scale => 6
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "phone"
    t.text     "description"
    t.string   "hours"
    t.integer  "category_id"
    t.decimal  "convertion_rate",        :precision => 2, :scale => 2
    t.string   "address_street"
    t.string   "address_number"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip_code"
    t.string   "address_country"
    t.string   "logo"
    t.string   "email"
    t.string   "facebook"
    t.string   "website"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "foursquare"
    t.integer  "days_to_expire",                                       :default => 60
    t.integer  "membership_id"
    t.boolean  "give_out_birthday_gith",                               :default => false
    t.integer  "birthday_gift"
    t.integer  "parent_merchant_id"
  end

  add_index "merchants", ["category_id"], :name => "index_merchants_on_category_id"
  add_index "merchants", ["name"], :name => "index_merchants_on_name"

  create_table "rewards", :force => true do |t|
    t.integer  "merchant_id"
    t.string   "name"
    t.integer  "credits"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_cards", :force => true do |t|
    t.integer  "card_id"
    t.integer  "user_id"
    t.string   "card_number"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_name"
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,      :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "admin",                  :default => false
    t.boolean  "isMerchantUser",         :default => false
    t.integer  "merchant_id"
    t.string   "role",                   :default => "user"
    t.date     "birthdate"
    t.string   "gender"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
