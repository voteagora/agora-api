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

  create_table "address_stats", id: :text, force: :cascade do |t|
    t.text "account", null: false
    t.integer "tokens_owned", null: false
    t.bigint "number_of_delegators"
    t.integer "total_voting_power"
    t.bigint "updated_at", null: false
  end

  create_table "balances", id: :text, force: :cascade do |t|
    t.text "address"
    t.text "token", null: false
    t.decimal "amount", null: false
    t.bigint "created_at"
    t.bigint "updated_at"
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

  create_table "delegations", id: :text, force: :cascade do |t|
    t.text "delegator_addr", null: false
    t.text "delegatee_addr", null: false
    t.text "token", null: false
    t.decimal "amount", null: false
    t.text "kind", null: false
    t.bigint "updated_at", null: false
  end

  create_table "events", id: :text, force: :cascade do |t|
    t.text "kind"
    t.text "token", null: false
    t.text "event_data"
    t.bigint "created_at"
  end

  create_table "nouns_nft", id: :text, force: :cascade do |t|
    t.text "owner", null: false
    t.decimal "background", null: false
    t.decimal "body", null: false
    t.decimal "accessory", null: false
    t.decimal "head", null: false
    t.decimal "glasses", null: false
  end

  create_table "proposal_stats", id: :text, force: :cascade do |t|
    t.text "proposal_uuid"
    t.text "token", null: false
    t.bigint "total_votes", null: false
    t.integer "total_votes_for", null: false
    t.integer "total_votes_against", null: false
    t.integer "total_votes_abstain", null: false
    t.decimal "total_voting_power"
    t.decimal "total_voting_power_for"
    t.decimal "total_voting_power_against"
    t.decimal "total_voting_power_abstain"
    t.integer "total_votes_with_reason", null: false
  end

  create_table "proposals", id: :text, force: :cascade do |t|
    t.text "uuid"
    t.text "proposer_addr"
    t.text "token", null: false
    t.text "targets"
    t.text "values"
    t.text "signatures"
    t.text "start_block"
    t.text "end_block"
    t.text "description"
  end

  create_table "raw_logs", id: :text, force: :cascade do |t|
    t.text "address"
    t.text "event_signature"
    t.text "event_params", array: true
    t.bigint "block_number"
    t.text "block_hash"
    t.bigint "log_index"
    t.text "transaction_hash"
    t.bigint "transaction_index"
    t.text "data"
    t.text "topics"
  end

  create_table "users", id: :text, force: :cascade do |t|
    t.text "account", null: false
    t.bigint "updated_at", null: false
  end

  create_table "votes", id: :text, force: :cascade do |t|
    t.text "address"
    t.text "proposal_id"
    t.integer "support", null: false
    t.decimal "amount", null: false
    t.text "reason"
    t.bigint "created_at", null: false
  end

  add_foreign_key "delegate_bios", "delegate_statements"
end
