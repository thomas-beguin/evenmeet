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

ActiveRecord::Schema[7.0].define(version: 2023_03_07_113904) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.text "description"
    t.bigint "reward_id", null: false
    t.bigint "relationship_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationship_id"], name: "index_challenges_on_relationship_id"
    t.index ["reward_id"], name: "index_challenges_on_reward_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "nature"
    t.text "description"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "relationship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationship_id"], name: "index_messages_on_relationship_id"
  end

  create_table "participations", force: :cascade do |t|
    t.string "hint"
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participations_on_event_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "status"
    t.bigint "participation_sender_id"
    t.bigint "participation_recipient_id"
    t.bigint "reward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participation_recipient_id"], name: "index_relationships_on_participation_recipient_id"
    t.index ["participation_sender_id"], name: "index_relationships_on_participation_sender_id"
    t.index ["reward_id"], name: "index_relationships_on_reward_id"
  end

  create_table "reward_choices", force: :cascade do |t|
    t.integer "status"
    t.bigint "participation_id", null: false
    t.bigint "reward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participation_id"], name: "index_reward_choices_on_participation_id"
    t.index ["reward_id"], name: "index_reward_choices_on_reward_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rewards_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "city"
    t.string "first_name"
    t.string "last_name"
    t.string "tags"
    t.string "position"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "challenges", "relationships"
  add_foreign_key "challenges", "rewards"
  add_foreign_key "messages", "relationships"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "users"
  add_foreign_key "relationships", "participations", column: "participation_recipient_id"
  add_foreign_key "relationships", "participations", column: "participation_sender_id"
  add_foreign_key "relationships", "rewards"
  add_foreign_key "reward_choices", "rewards"
  add_foreign_key "rewards", "events"
end
