# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_06_13_135555) do
  create_table "client_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "client_id"
    t.string "name"
    t.string "name_kana"
    t.string "email"
    t.text "password_digest"
    t.integer "role", default: 1
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_users_on_client_id"
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "point_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "record_type"
    t.integer "value"
    t.string "eventable_type"
    t.integer "eventable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eventable_id"], name: "index_point_records_on_eventable_id"
    t.index ["eventable_type"], name: "index_point_records_on_eventable_type"
    t.index ["record_type"], name: "index_point_records_on_record_type"
    t.index ["user_id"], name: "index_point_records_on_user_id"
  end

  create_table "point_settings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "client_id"
    t.boolean "is_valid", default: false
    t.string "original_name"
    t.float "rate", default: 0.0
    t.integer "valid_days", default: 0
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_point_settings_on_client_id"
  end

  create_table "rank_automations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "before_rank_id"
    t.integer "after_rank_id"
    t.integer "automation_type"
    t.integer "value"
    t.integer "term"
    t.datetime "last_checked_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["after_rank_id"], name: "index_rank_automations_on_after_rank_id"
    t.index ["automation_type"], name: "index_rank_automations_on_automation_type"
    t.index ["before_rank_id"], name: "index_rank_automations_on_before_rank_id"
  end

  create_table "rank_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "before_rank_id"
    t.integer "after_rank_id"
    t.datetime "changed_at"
    t.string "changerable_type"
    t.integer "changerable_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["after_rank_id"], name: "index_rank_records_on_after_rank_id"
    t.index ["before_rank_id"], name: "index_rank_records_on_before_rank_id"
    t.index ["changerable_id"], name: "index_rank_records_on_changerable_id"
    t.index ["user_id"], name: "index_rank_records_on_user_id"
  end

  create_table "ranks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "client_id"
    t.string "name"
    t.float "point_rate"
    t.integer "color", default: 1
    t.boolean "is_default", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_ranks_on_client_id"
  end

  create_table "user_ranks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "rank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rank_id"], name: "index_user_ranks_on_rank_id"
    t.index ["user_id"], name: "index_user_ranks_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "client_id"
    t.string "name"
    t.integer "default_payway", default: 1
    t.datetime "deleted_at"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "point", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["default_payway"], name: "index_users_on_default_payway"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
