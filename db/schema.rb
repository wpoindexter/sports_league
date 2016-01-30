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

ActiveRecord::Schema.define(version: 20160130004733) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "parent_id"
    t.integer  "player_id"
    t.integer  "coach_id"
  end

  add_index "addresses", ["coach_id"], name: "index_addresses_on_coach_id"
  add_index "addresses", ["parent_id"], name: "index_addresses_on_parent_id"
  add_index "addresses", ["player_id"], name: "index_addresses_on_player_id"

  create_table "coaches", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "status"
    t.string   "email"
    t.string   "phone"
    t.boolean  "head_coach"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents_players", id: false, force: :cascade do |t|
    t.integer "parent_id", null: false
    t.integer "player_id", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.integer  "weight"
    t.integer  "grade"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "status"
    t.boolean  "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
    t.integer  "sport_id"
    t.integer  "season_id"
  end

  add_index "registrations", ["player_id"], name: "index_registrations_on_player_id"
  add_index "registrations", ["season_id"], name: "index_registrations_on_season_id"
  add_index "registrations", ["sport_id"], name: "index_registrations_on_sport_id"

  create_table "roster_positions", force: :cascade do |t|
    t.integer "rank"
    t.integer "roster_spot_id"
    t.integer "position_id"
  end

  add_index "roster_positions", ["position_id"], name: "index_roster_positions_on_position_id"
  add_index "roster_positions", ["roster_spot_id"], name: "index_roster_positions_on_roster_spot_id"

  create_table "roster_spots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
    t.integer  "team_id"
  end

  add_index "roster_spots", ["player_id"], name: "index_roster_spots_on_player_id"
  add_index "roster_spots", ["team_id"], name: "index_roster_spots_on_team_id"

  create_table "seasons", force: :cascade do |t|
    t.date     "start"
    t.date     "end"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_coaches", force: :cascade do |t|
    t.boolean  "head_coach"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
    t.integer  "coach_id"
  end

  add_index "team_coaches", ["coach_id"], name: "index_team_coaches_on_coach_id"
  add_index "team_coaches", ["team_id"], name: "index_team_coaches_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.integer  "grade1"
    t.integer  "grade2"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sport_id"
    t.integer  "season_id"
  end

  add_index "teams", ["season_id"], name: "index_teams_on_season_id"
  add_index "teams", ["sport_id"], name: "index_teams_on_sport_id"

end
