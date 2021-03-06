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

ActiveRecord::Schema.define(:version => 20121023012639) do

  create_table "links", :force => true do |t|
    t.text     "url"
    t.text     "title"
    t.text     "summary"
    t.integer  "source_id"
    t.text     "display_url"
    t.datetime "published_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "links", ["source_id"], :name => "index_links_on_source_id"

  create_table "post_sources", :force => true do |t|
    t.integer  "post_id"
    t.integer  "source_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "post_sources", ["post_id", "source_id"], :name => "index_post_sources_on_post_id_and_source_id"
  add_index "post_sources", ["post_id"], :name => "index_post_sources_on_post_id"
  add_index "post_sources", ["source_id"], :name => "index_post_sources_on_source_id"

  create_table "posts", :force => true do |t|
    t.text     "url"
    t.date     "published_on"
    t.text     "title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "content"
    t.text     "link_title"
    t.text     "link_url"
  end

  create_table "search_links", :force => true do |t|
    t.integer  "search_id"
    t.integer  "link_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "sequence"
  end

  add_index "search_links", ["link_id"], :name => "index_search_links_on_link_id"
  add_index "search_links", ["search_id", "link_id"], :name => "index_search_links_on_search_id_and_link_id"
  add_index "search_links", ["search_id"], :name => "index_search_links_on_search_id"

  create_table "searches", :force => true do |t|
    t.string   "query"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "searches", ["query"], :name => "index_searches_on_query"

  create_table "sources", :force => true do |t|
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "posts_count"
  end

  add_index "sources", ["posts_count"], :name => "index_sources_on_posts_count"

end
