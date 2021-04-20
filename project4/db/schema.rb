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

ActiveRecord::Schema.define(version: 2021_04_19_184406) do

  create_table "applications", force: :cascade do |t|
    t.string "applicant"
    t.string "email"
    t.string "course"
    t.integer "section"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.string "term", null: false
    t.string "units"
    t.string "campus"
    t.string "subject", default: "CSE"
    t.string "catalog_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "dot"
    t.string "year"
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "name"
    t.string "course"
    t.integer "section"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "classNumber", null: false
    t.string "meetingDays"
    t.string "meetingTimes"
    t.integer "waitlistTotal"
    t.string "endDate"
    t.string "startDate"
    t.string "enrollmentStatus"
    t.string "instructionMode"
    t.string "component"
    t.string "section"
    t.integer "courseID", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "grader"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.text "classes"
    t.integer "user_id", null: false
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
    t.string "fname"
    t.string "lname"
    t.string "nameDotNumber"
    t.string "year"
    t.string "user_type"
    t.string "verified", default: "false"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "students", "users"
end
