class CreateProposalStats < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_stats, if_not_exists: true do |t|
      t.string :proposal_uuid, null: false
      t.string :token, null: false
      t.bigint :total_votes
      t.float :total_voting_power
      t.float :total_voting_power_used
      t.float :total_voting_power_not_used
      t.float :total_voting_power_abstain
      t.bigint :total_votes_for
      t.bigint :total_votes_against
      t.bigint :total_votes_abstain
      t.bigint :total_votes_with_reason
      t.float :total_voting_power_no
      t.float :total_voting_power_yes
      t.float :total_voting_power_abstain_percent
      t.float :total_voting_power_no_percent
      t.float :total_voting_power_yes_percent
      t.float :total_voting_power_used_percent
      t.float :total_voting_power_not_used_percent
      t.float :quorum
      t.bigint :quorum_percent
      t.boolean :quorum_reached
      t.string :status
      t.timestamps
    end
  end
end
