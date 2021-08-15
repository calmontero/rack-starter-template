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

ActiveRecord::Schema.define(version: 2021_08_14_145332) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "creation"
    t.string "history"
    t.string "real_name"
    t.string "alignment"
    t.string "image_url"
    t.string "wikipedia_url"
    t.integer "publisher_id"
    t.index ["publisher_id"], name: "index_characters_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "history"
    t.integer "founded"
    t.string "country"
    t.string "image_url"
    t.string "wikipedia_url"
  end

end
