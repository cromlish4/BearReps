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

ActiveRecord::Schema.define(version: 2021_03_16_000835) do

  create_table "courses", force: :cascade do |t|
    t.string "title" null: false
    t.string "term" null: false
    t.string "units" null: false
    t.string "campus" null: false
    t.string "subject" null: false
    t.string "catalog_number" null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "fname" null: false
    t.string "lname" null: false
    t.string "dot" null: false
    t.string "year" null: false
    t.string "username" null: false
    t.string "password" null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
