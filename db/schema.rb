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

ActiveRecord::Schema.define(version: 20160130181245) do

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
    t.integer  "season_id"
  end

  add_index "registrations", ["player_id"], name: "index_registrations_on_player_id"
  add_index "registrations", ["season_id"], name: "index_registrations_on_season_id"

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
    t.integer  "sport_id"
  end

  add_index "seasons", ["sport_id"], name: "index_seasons_on_sport_id"

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_coaches", force: :cascade do |t|
    t.boolean  "head_coach"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
    t.integer  "coach_id"
  end

  add_index "team_coaches", ["coach_id"], name: "index_team_coaches_on_coach_id"
  add_index "team_coaches", ["team_id"], name: "index_team_coaches_on_team_id"

  create_table "team_managers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
  end

  add_index "team_managers", ["team_id"], name: "index_team_managers_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.integer  "grade1"
    t.integer  "grade2"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "season_id"
  end

  add_index "teams", ["season_id"], name: "index_teams_on_season_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
