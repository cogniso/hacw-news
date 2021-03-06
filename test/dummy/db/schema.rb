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

ActiveRecord::Schema.define(version: 20150712154833) do

  create_table "news_comments", force: :cascade do |t|
    t.integer  "story_id"
    t.text     "body"
    t.integer  "points",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
  end

  add_index "news_comments", ["parent_id"], name: "index_news_comments_on_parent_id"
  add_index "news_comments", ["rgt"], name: "index_news_comments_on_rgt"

  create_table "news_stories", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "image"
    t.integer  "points"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "submitter_name"
    t.string   "submitter_email"
    t.boolean  "approved",        default: false
    t.string   "slug"
  end

  add_index "news_stories", ["slug"], name: "index_news_stories_on_slug", unique: true

end
