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

ActiveRecord::Schema.define(version: 20151229172317) do

  create_table "forums", force: :cascade do |t|
    t.string  "name",         limit: 255,             null: false
    t.string  "seo_name",     limit: 255,             null: false
    t.string  "description",  limit: 255
    t.integer "num_topics",   limit: 4,   default: 0
    t.integer "num_posts",    limit: 4,   default: 0
    t.integer "last_post_id", limit: 4
    t.integer "parent_id",    limit: 4
  end

  add_index "forums", ["parent_id"], name: "index_forums_on_parent_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "topic_id",  limit: 4,                     null: false
    t.integer  "user_id",   limit: 4,                     null: false
    t.datetime "post_date",                               null: false
    t.text     "content",   limit: 65535
    t.boolean  "edited",    limit: 1,     default: false
    t.datetime "edit_date"
    t.boolean  "is_first",  limit: 1,     default: false
  end

  add_index "posts", ["topic_id"], name: "fk_rails_70d0b6486a", using: :btree
  add_index "posts", ["user_id"], name: "fk_rails_5b5ddfd518", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name",         limit: 255,                 null: false
    t.string   "seo_name",     limit: 255,                 null: false
    t.datetime "post_date",                                null: false
    t.integer  "forum_id",     limit: 4,                   null: false
    t.integer  "user_id",      limit: 4,                   null: false
    t.integer  "num_posts",    limit: 4,   default: 0
    t.integer  "last_post_id", limit: 4
    t.boolean  "pinned",       limit: 1,   default: false
    t.boolean  "closed",       limit: 1,   default: false
  end

  add_index "topics", ["forum_id"], name: "index_topics_on_forum_id", using: :btree
  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "username",               limit: 255
    t.string   "seo_name",               limit: 255,                 null: false
    t.boolean  "is_admin",               limit: 1,   default: false
    t.boolean  "is_moderator",           limit: 1,   default: false
    t.integer  "num_posts",              limit: 4,   default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "forums", "forums", column: "parent_id"
  add_foreign_key "posts", "topics"
  add_foreign_key "posts", "users"
  add_foreign_key "topics", "forums"
  add_foreign_key "topics", "users"
end
