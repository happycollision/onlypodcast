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

ActiveRecord::Schema.define(:version => 20130724015701) do

  create_table "admin_users", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "username"
    t.string   "hashed_password"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "salt"
  end

  create_table "episodes", :force => true do |t|
    t.string   "title"
    t.integer  "number"
    t.datetime "date"
    t.text     "show_notes"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "duration"
    t.string   "art_name"
    t.text     "description"
    t.string   "keywords"
    t.integer  "podcast_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "episodes", ["podcast_id"], :name => "index_episodes_on_podcast_id"

  create_table "personalities", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.text     "bio"
    t.string   "image"
    t.string   "gravatar_email"
    t.boolean  "use_gravatar_bio"
    t.boolean  "use_gravatar_image"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "podcasts", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "url"
    t.text     "description"
    t.string   "keywords"
    t.boolean  "explicit"
    t.string   "category"
    t.string   "subcategories"
    t.string   "author"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
