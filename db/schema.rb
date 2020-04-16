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

ActiveRecord::Schema.define(version: 2020_04_16_123544) do

  create_table "courses", force: :cascade do |t|
    t.integer "vault_id"
    t.string "title"
    t.string "status"
    t.text "description"
    t.string "topic"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vault_id"], name: "index_courses_on_vault_id"
  end

  create_table "recordings", force: :cascade do |t|
    t.string "status"
    t.string "recording_type"
    t.integer "course_id"
    t.index ["course_id"], name: "index_recordings_on_course_id"
  end

  create_table "vaults", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "recordings", "courses"
end
