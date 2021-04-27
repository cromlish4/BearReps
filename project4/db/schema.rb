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

ActiveRecord::Schema.define(version: 2021_04_27_172313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.text "nameDotNumber"
    t.text "email"
    t.text "course"
    t.text "comments"
    t.text "approved", default: "false"
    t.text "employed_status", default: "non_employed"
    t.text "assigned", default: "unassigned"
    t.text "assigned_class", default: "unassigned"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "instr_comments"
  end

  create_table "courses", force: :cascade do |t|
    t.text "title", null: false
    t.text "term", null: false
    t.text "units", null: false
    t.text "campus"
    t.text "subject", default: "CSE"
    t.text "catalog_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.text "fname"
    t.text "lname"
    t.text "dot"
    t.text "year"
    t.text "username"
    t.text "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.text "name"
    t.text "course"
    t.integer "section"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "classNumber", null: false
    t.text "meetingDays"
    t.text "meetingTimes"
    t.integer "waitlistTotal"
    t.text "endDate"
    t.text "startDate"
    t.text "enrollmentStatus"
    t.text "instructionMode"
    t.text "component"
    t.text "section"
    t.text "instructor"
    t.integer "courseID", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "grader"
  end

  create_table "students", force: :cascade do |t|
    t.text "name"
    t.text "classes"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "fname"
    t.text "lname"
    t.text "nameDotNumber"
    t.text "year"
    t.text "user_type"
    t.text "verified", default: "false"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "students", "users"
end
