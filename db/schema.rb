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

ActiveRecord::Schema.define(version: 2020_04_20_230732) do

  create_table "buckets", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bucketable_id"
    t.string "bucketable_type"
    t.index ["bucketable_type", "bucketable_id"], name: "index_buckets_on_bucketable_type_and_bucketable_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "bucket_id", null: false
    t.text "body"
    t.index ["bucket_id"], name: "index_comments_on_bucket_id"
  end

  create_table "content_recommendations", force: :cascade do |t|
    t.string "recommendable_type"
    t.integer "recommendable_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recommendable_type", "recommendable_id"], name: "index_content_recommendations_on_recommendable_and_user"
    t.index ["user_id"], name: "index_content_recommendations_on_user_id"
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

  create_table "statuses", force: :cascade do |t|
    t.integer "bucket_id", null: false
    t.integer "user_id", null: false
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bucket_id"], name: "index_statuses_on_bucket_id"
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vaults", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "buckets"
  add_foreign_key "statuses", "buckets"
  add_foreign_key "statuses", "users"
end
