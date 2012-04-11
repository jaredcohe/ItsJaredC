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

ActiveRecord::Schema.define(:version => 20111121141935) do

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

  create_table "farmings", :force => true do |t|
    t.integer  "lesson_plantation_id"
    t.integer  "knowledge_id"
    t.string   "title"
    t.text     "notes"
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
    t.text     "keywords"
  end

  create_table "lesson_plantations", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.text     "keywords"
    t.boolean  "clean"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "knowledge_id"
    t.integer  "lesson_plantation_id"
    t.integer  "order"
    t.integer  "score"
    t.text     "review"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "user_knowledge_states", :force => true do |t|
    t.integer  "user_id"
    t.integer  "knowledge_id"
    t.integer  "user_knowledge_state_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_knowledge_states", ["knowledge_id"], :name => "index_user_knowledge_states_on_knowledge_id"
  add_index "user_knowledge_states", ["user_id"], :name => "index_user_knowledge_states_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.text     "user_name"
  end

end
