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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140811142546) do
=======
ActiveRecord::Schema.define(version: 20140817125320) do
>>>>>>> 00f74d0f1050d8900b13d9de18decee6f29b6880

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "file"
    t.boolean  "public",      default: false
    t.string   "title",       default: ""
    t.text     "description", default: ""
    t.integer  "user_id"
    t.boolean  "persional",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "exif"
  end

  create_table "musics", force: true do |t|
    t.string   "title"
    t.string   "file"
    t.string   "user_id"
    t.string   "src"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "nickname"
    t.text     "description"
    t.date     "birthday"
    t.string   "sex"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "scores", force: true do |t|
    t.float    "score",      default: 0.0
    t.integer  "liker",                    array: true
    t.integer  "favor",                    array: true
    t.integer  "viewer"
    t.integer  "editor_rec",               array: true
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.integer  "power",                  default: 0
    t.string   "username",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "viewer"
    t.string   "pku_id"
    t.integer  "follower",                                         array: true
    t.integer  "following",                                        array: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.string   "owner"
    t.integer  "youkuid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
