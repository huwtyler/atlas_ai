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

ActiveRecord::Schema[7.1].define(version: 2025_04_09_183807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meal_plans", force: :cascade do |t|
    t.integer "week_number"
    t.integer "day_of_week"
    t.jsonb "meals"
    t.bigint "training_phase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_phase_id"], name: "index_meal_plans_on_training_phase_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.jsonb "data"
    t.date "date_logged"
    t.bigint "training_phase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_phase_id"], name: "index_measurements_on_training_phase_id"
  end

  create_table "prompt_logs", force: :cascade do |t|
    t.string "kind"
    t.text "prompt_text"
    t.text "response_text"
    t.string "model_used"
    t.bigint "user_id", null: false
    t.bigint "training_phase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_phase_id"], name: "index_prompt_logs_on_training_phase_id"
    t.index ["user_id"], name: "index_prompt_logs_on_user_id"
  end

  create_table "training_phases", force: :cascade do |t|
    t.string "goal"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_training_phases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.float "height"
    t.float "weight"
    t.integer "age"
    t.string "sex"
    t.jsonb "dietary_preferences", default: {}
    t.jsonb "equipment_list", default: []
    t.integer "weekly_training_target"
    t.string "stripe_customer_id"
    t.string "stripe_subscription_id"
    t.string "subscription_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_completions", force: :cascade do |t|
    t.datetime "completed_at"
    t.jsonb "plan_content"
    t.bigint "workout_plan_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workout_completions_on_user_id"
    t.index ["workout_plan_id"], name: "index_workout_completions_on_workout_plan_id"
  end

  create_table "workout_plans", force: :cascade do |t|
    t.integer "week_number"
    t.integer "day_number"
    t.jsonb "content"
    t.bigint "training_phase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_phase_id"], name: "index_workout_plans_on_training_phase_id"
  end

  add_foreign_key "meal_plans", "training_phases"
  add_foreign_key "measurements", "training_phases"
  add_foreign_key "prompt_logs", "training_phases"
  add_foreign_key "prompt_logs", "users"
  add_foreign_key "training_phases", "users"
  add_foreign_key "workout_completions", "users"
  add_foreign_key "workout_completions", "workout_plans"
  add_foreign_key "workout_plans", "training_phases"
end
