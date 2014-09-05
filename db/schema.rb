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

ActiveRecord::Schema.define(version: 20140828145312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "content"
    t.boolean  "primery"
    t.integer  "article_id"
    t.integer  "image_id"
    t.integer  "video_id"
    t.integer  "music_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree
  add_index "comments", ["image_id"], name: "index_comments_on_image_id", using: :btree
  add_index "comments", ["music_id"], name: "index_comments_on_music_id", using: :btree
  add_index "comments", ["video_id"], name: "index_comments_on_video_id", using: :btree

  create_table "dmvideos", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "tudouid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "des"
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
    t.integer  "user_id"
    t.string   "src"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "des"
    t.string   "cover"
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
    t.integer  "music_id"
    t.integer  "article_id"
    t.integer  "video_id"
    t.integer  "dmvideo_id"
  end

  add_index "scores", ["article_id"], name: "index_scores_on_article_id", using: :btree

  create_table "thumbs", force: true do |t|
    t.string   "file"
    t.integer  "music_id"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "thumbs", ["music_id"], name: "index_thumbs_on_music_id", using: :btree
  add_index "thumbs", ["video_id"], name: "index_thumbs_on_video_id", using: :btree

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
    t.string   "youkuid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover"
    t.text     "des"
  end

end
