# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_10_173949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "route_definitions", force: :cascade do |t|
    t.string "name"
    t.geography "boundaries", limit: {:srid=>4326, :type=>"st_polygon", :geographic=>true}
    t.geography "origin", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.geography "destination", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "vehicle_id", null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "route_definition_id", null: false
    t.index ["route_definition_id"], name: "index_routes_on_route_definition_id"
    t.index ["vehicle_id"], name: "index_routes_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "identifier"
    t.string "device_serial_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "waypoints", force: :cascade do |t|
    t.geography "point", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.bigint "route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["route_id"], name: "index_waypoints_on_route_id"
  end

  add_foreign_key "routes", "route_definitions"
  add_foreign_key "routes", "vehicles"
  add_foreign_key "waypoints", "routes"
end
