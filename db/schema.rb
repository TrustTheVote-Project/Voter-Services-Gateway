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

ActiveRecord::Schema.define(version: 20160629051541) do

  create_table "electors", force: true do |t|
    t.string   "elector_id"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "gender"
    t.integer  "dob_year"
    t.integer  "dob_month"
    t.integer  "dob_day"
    t.integer  "address_number"
    t.string   "address_number_suffix"
    t.string   "unit_number"
    t.string   "street_name"
    t.string   "street_type"
    t.string   "street_direction"
    t.string   "place"
    t.string   "province"
    t.string   "postal_code"
    t.string   "rural_address_line"
    t.string   "mailing_address_line_1"
    t.string   "mailing_address_line_2"
    t.string   "mailing_place"
    t.string   "mailing_province"
    t.string   "mailing_postal_code"
    t.string   "mailing_country_code"
    t.string   "ed_id"
    t.string   "english_name"
    t.string   "poll_name"
    t.datetime "create_date"
    t.datetime "modify_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voters", force: true do |t|
    t.string   "elector_id"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "gender"
    t.integer  "dob_year"
    t.integer  "dob_month"
    t.integer  "dob_day"
    t.integer  "address_number"
    t.string   "address_number_suffix"
    t.string   "unit_number"
    t.string   "street_name"
    t.string   "street_type"
    t.string   "street_direction"
    t.string   "place"
    t.string   "province"
    t.string   "postal_code"
    t.string   "rural_address_line"
    t.string   "mailing_address_line_1"
    t.string   "mailing_address_line_2"
    t.string   "mailing_place"
    t.string   "mailing_province"
    t.string   "mailing_postal_code"
    t.string   "mailing_country_code"
    t.string   "request_status"
    t.datetime "request_date"
    t.integer  "request_uid"
    t.datetime "modify_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
