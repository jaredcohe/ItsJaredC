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

ActiveRecord::Schema.define(:version => 20111022184635) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", :force => true do |t|
    t.integer  "knowledge_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knowledges", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "free"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "knowledge_kind"
    t.string   "level"
    t.string   "medium"
    t.string   "string_id"
    t.boolean  "clean"
  end

  create_table "originations", :force => true do |t|
    t.integer  "knowledge_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "string_id"
    t.boolean  "clean"
    t.string   "about"
  end

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], :name => "index_subcategories_on_category_id"

  create_table "subcategorizations", :force => true do |t|
    t.integer  "knowledge_id"
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
