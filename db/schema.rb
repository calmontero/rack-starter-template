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

ActiveRecord::Schema.define(version: 2021_08_11_230539) do

  create_table "fans", force: :cascade do |t|
    t.string "name"
    t.integer "phone_number"
    t.string "email"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "sponsor"
    t.integer "quantity_fan"
    t.integer "sits_available"
    t.integer "room"
    t.date "date"
    t.time "startTime"
    t.time "endTime"
    t.string "image_url"
    t.boolean "status"
  end

  create_table "registers", force: :cascade do |t|
    t.integer "program_id"
    t.integer "fan_id"
    t.date "register_date"
  end

end
