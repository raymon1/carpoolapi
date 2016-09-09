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

ActiveRecord::Schema.define(version: 20160908224322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_joins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_trip_joins_on_trip_id", using: :btree
    t.index ["user_id"], name: "index_trip_joins_on_user_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.datetime "departure_time"
    t.integer  "seats"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["destination_id"], name: "index_trips_on_destination_id", using: :btree
    t.index ["driver_id"], name: "index_trips_on_driver_id", using: :btree
    t.index ["source_id"], name: "index_trips_on_source_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.integer  "group_id"
    t.integer  "home_place_id"
    t.integer  "work_place_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["group_id"], name: "index_users_on_group_id", using: :btree
    t.index ["home_place_id"], name: "index_users_on_home_place_id", using: :btree
    t.index ["work_place_id"], name: "index_users_on_work_place_id", using: :btree
  end

  add_foreign_key "trip_joins", "trips"
  add_foreign_key "trip_joins", "users"
  add_foreign_key "trips", "places", column: "destination_id"
  add_foreign_key "trips", "places", column: "source_id"
  add_foreign_key "trips", "users", column: "driver_id"
  add_foreign_key "users", "groups"
  add_foreign_key "users", "places", column: "home_place_id"
  add_foreign_key "users", "places", column: "work_place_id"
end
