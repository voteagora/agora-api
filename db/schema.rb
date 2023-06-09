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

ActiveRecord::Schema[7.0].define(version: 2023_07_05_003928) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_stats", force: :cascade do |t|
    t.string "address"
    t.string "token"
    t.float "tokens_owned", default: 0.0
    t.float "tokens_delegated", default: 0.0
    t.float "tokens_partial_delegated", default: 0.0
    t.float "tokens_liquid_delegated", default: 0.0
    t.float "total_voting_power", default: 0.0
    t.bigint "number_of_delegators", default: 0
    t.bigint "number_of_delegatees", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address", "token"], name: "index_address_stats_on_address_and_token", unique: true
  end

  create_table "api_users", force: :cascade do |t|
    t.string "api_key"
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
    t.string "chain", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delegate_bios", force: :cascade do |t|
    t.bigint "delegate_statement_id", null: false
    t.string "address", null: false
    t.string "token", null: false
    t.jsonb "signature_data"
    t.string "twitter_handle"
    t.string "discord_handle"
    t.string "farcaster_handle"
    t.string "telegram_handle"
    t.string "email"
    t.string "website"
    t.string "github_handle"
    t.boolean "email_verified", default: false
    t.boolean "open_to_delegation", default: false
    t.boolean "open_to_proposals", default: false
    t.boolean "open_to_questions", default: false
    t.boolean "agreed_to_code_of_conduct", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delegate_statement_id"], name: "index_delegate_bios_on_delegate_statement_id"
  end

  create_table "delegate_statements", force: :cascade do |t|
    t.string "address", null: false
    t.text "statement", null: false
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
    t.string "kind", default: "token"
    t.jsonb "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ens_records", force: :cascade do |t|
    t.string "address"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_ens_records_on_address"
  end

  create_table "events", force: :cascade do |t|
    t.string "kind"
    t.string "token"
    t.string "address"
    t.jsonb "event_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposal_stats", force: :cascade do |t|
    t.string "proposal_uuid", null: false
    t.string "token", null: false
    t.bigint "total_votes"
    t.float "total_voting_power"
    t.float "total_voting_power_used"
    t.float "total_voting_power_not_used"
    t.float "total_voting_power_abstain"
    t.bigint "total_votes_for"
    t.bigint "total_votes_against"
    t.bigint "total_votes_abstain"
    t.bigint "total_votes_with_reason"
    t.float "total_voting_power_no"
    t.float "total_voting_power_yes"
    t.float "total_voting_power_abstain_percent"
    t.float "total_voting_power_no_percent"
    t.float "total_voting_power_yes_percent"
    t.float "total_voting_power_used_percent"
    t.float "total_voting_power_not_used_percent"
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

  add_foreign_key "delegate_bios", "delegate_statements"
end
