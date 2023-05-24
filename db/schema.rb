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

ActiveRecord::Schema[7.0].define(version: 2023_05_24_133754) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_users", force: :cascade do |t|
    t.string "api_key", null: false
    t.datetime "expires_at"
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "balances", force: :cascade do |t|
    t.string "address", null: false
    t.string "token", null: false
    t.float "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daos", force: :cascade do |t|
    t.string "name", null: false
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delegations", force: :cascade do |t|
    t.string "delegator_addr", null: false
    t.string "delegatee_addr", null: false
    t.string "token", null: false
    t.float "amount", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ens_records", force: :cascade do |t|
    t.string "address"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposal_stats", force: :cascade do |t|
    t.string "proposal_uuid", null: false
    t.string "token", null: false
    t.bigint "total_votes"
    t.bigint "total_voters"
    t.bigint "total_voting_power"
    t.bigint "total_voting_power_used"
    t.bigint "total_voting_power_not_used"
    t.bigint "total_voting_power_abstain"
    t.bigint "total_voting_power_no"
    t.bigint "total_voting_power_yes"
    t.bigint "total_voting_power_abstain_percent"
    t.bigint "total_voting_power_no_percent"
    t.bigint "total_voting_power_yes_percent"
    t.bigint "total_voting_power_used_percent"
    t.bigint "total_voting_power_not_used_percent"
    t.float "quorum"
    t.bigint "quorum_percent"
    t.boolean "quorum_reached"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "proposer_addr", null: false
    t.string "token", null: false
    t.text "targets"
    t.text "values"
    t.text "signatures"
    t.text "calldata"
    t.bigint "start_block"
    t.bigint "end_block"
    t.text "description"
    t.string "kind", default: "agora_standard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_users_on_address", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string "address", null: false
    t.string "proposal_uuid", null: false
    t.string "token", null: false
    t.integer "support", null: false
    t.float "amount", null: false
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
