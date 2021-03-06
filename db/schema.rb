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

ActiveRecord::Schema.define(version: 20150102110308) do

  create_table "games", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "lobby",      limit: 1, default: true
  end

  create_table "games_players", force: :cascade do |t|
    t.integer  "game_id",    limit: 4
    t.integer  "player_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letters", force: :cascade do |t|
    t.integer  "game_id",      limit: 4
    t.integer  "player_id",    limit: 4
    t.integer  "row_index",    limit: 4
    t.integer  "column_index", limit: 4
    t.string   "character",    limit: 255
    t.boolean  "blank",        limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "on_board",     limit: 1,   default: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
