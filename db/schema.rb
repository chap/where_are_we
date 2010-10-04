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

ActiveRecord::Schema.define(:version => 20101004143623) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unemployment_stats", :force => true do |t|
    t.integer  "unemployable_id"
    t.string   "unemployable_type"
    t.integer  "year"
    t.string   "coverage"
    t.string   "source"
    t.string   "unemployment_type"
    t.float    "unemployment_rate"
    t.integer  "total_workforce"
    t.integer  "total_employed"
    t.integer  "total_unemployed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "us_counties", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lat"
    t.float    "lng"
  end

  create_table "visits", :force => true do |t|
    t.integer  "us_county_id"
    t.integer  "match_country_id"
    t.string   "ip"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "positioning_success", :default => false, :null => false
    t.boolean  "geocode_success",     :default => false, :null => false
    t.integer  "zip"
    t.string   "city"
    t.string   "state"
    t.string   "province"
    t.string   "street_address"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
