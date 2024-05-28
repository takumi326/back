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

ActiveRecord::Schema[7.0].define(version: 2024_05_28_101049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.decimal "amount"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_type"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "classification_monthlyamounts", force: :cascade do |t|
    t.bigint "classification_id"
    t.string "month"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_id"], name: "index_classification_monthlyamounts_on_classification_id"
    t.index ["month", "classification_id"], name: "index_month_classification_id", unique: true
  end

  create_table "classifications", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "classification_type"
    t.index ["account_id"], name: "index_classifications_on_account_id"
    t.index ["user_id"], name: "index_classifications_on_user_id"
  end

  create_table "completed_repetition_tasks", force: :cascade do |t|
    t.bigint "task_id"
    t.date "completed_date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["task_id"], name: "index_completed_repetition_tasks_on_task_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "classification_id"
    t.bigint "category_id"
    t.decimal "amount"
    t.date "schedule"
    t.boolean "repetition", default: false
    t.string "repetition_type"
    t.jsonb "repetition_settings"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_date"
    t.index ["category_id"], name: "index_incomes_on_category_id"
    t.index ["classification_id"], name: "index_incomes_on_classification_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "classification_id"
    t.bigint "category_id"
    t.decimal "amount"
    t.date "schedule"
    t.boolean "repetition", default: false
    t.string "repetition_type"
    t.jsonb "repetition_settings"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_date"
    t.index ["category_id"], name: "index_payments_on_category_id"
    t.index ["classification_id"], name: "index_payments_on_classification_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "purposes", force: :cascade do |t|
    t.string "title"
    t.string "result"
    t.date "deadline"
    t.text "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["user_id"], name: "index_purposes_on_user_id"
  end

  create_table "repetition_moneys", force: :cascade do |t|
    t.bigint "payment_id"
    t.bigint "income_id"
    t.bigint "transfer_id"
    t.string "transaction_type", null: false
    t.decimal "amount"
    t.date "repetition_schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_id"], name: "index_repetition_moneys_on_income_id"
    t.index ["payment_id"], name: "index_repetition_moneys_on_payment_id"
    t.index ["transfer_id"], name: "index_repetition_moneys_on_transfer_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "purpose_id"
    t.string "title"
    t.date "schedule"
    t.time "time"
    t.boolean "repetition", default: false
    t.string "repetition_type"
    t.jsonb "repetition_settings", default: []
    t.boolean "completed", default: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_date"
    t.index ["purpose_id"], name: "index_tasks_on_purpose_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "before_account_id"
    t.bigint "after_account_id"
    t.decimal "amount"
    t.date "schedule"
    t.boolean "repetition", default: false
    t.string "repetition_type"
    t.jsonb "repetition_settings"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transfer_type"
    t.date "end_date"
    t.index ["after_account_id"], name: "index_transfers_on_after_account_id"
    t.index ["before_account_id"], name: "index_transfers_on_before_account_id"
    t.index ["user_id"], name: "index_transfers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "classification_monthlyamounts", "classifications"
  add_foreign_key "classifications", "accounts"
  add_foreign_key "classifications", "users"
  add_foreign_key "completed_repetition_tasks", "tasks"
  add_foreign_key "incomes", "categories"
  add_foreign_key "incomes", "classifications"
  add_foreign_key "incomes", "users"
  add_foreign_key "payments", "categories"
  add_foreign_key "payments", "classifications"
  add_foreign_key "payments", "users"
  add_foreign_key "purposes", "users"
  add_foreign_key "repetition_moneys", "incomes"
  add_foreign_key "repetition_moneys", "payments"
  add_foreign_key "repetition_moneys", "transfers"
  add_foreign_key "tasks", "purposes"
  add_foreign_key "tasks", "users"
  add_foreign_key "transfers", "accounts", column: "after_account_id"
  add_foreign_key "transfers", "accounts", column: "before_account_id"
  add_foreign_key "transfers", "users"
end
