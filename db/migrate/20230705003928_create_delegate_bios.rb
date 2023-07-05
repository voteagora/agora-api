class CreateDelegateBios < ActiveRecord::Migration[7.0]
  def change
    create_table :delegate_bios do |t|
      t.belongs_to :delegate_statement, null: false, foreign_key: true
      t.string :address, null: false
      t.string :token, null: false
      t.jsonb  :signature_data
      t.string :twitter_handle
      t.string :discord_handle
      t.string :farcaster_handle
      t.string :telegram_handle
      t.string :email
      t.string :website
      t.string :github_handle
      t.boolean :email_verified, default: false
      t.boolean :open_to_delegation, default: false
      t.boolean :open_to_proposals, default: false
      t.boolean :open_to_questions, default: false
      t.boolean :agreed_to_code_of_conduct, default: false
      t.timestamps
    end
  end
end
