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

ActiveRecord::Schema.define(version: 2020_04_17_040442) do

  create_table "buckets", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bucketable_id"
    t.string "bucketable_type"
    t.index ["bucketable_type", "bucketable_id"], name: "index_buckets_on_bucketable_type_and_bucketable_id"
  end

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
    t.integer "recordable_id"
    t.string "recordable_type"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["recordable_type", "recordable_id"], name: "index_recordings_on_recordable_type_and_recordable_id"
  end

  create_table "vaults", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
