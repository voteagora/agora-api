class CreateProposalStats < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_stats do |t|
      t.string :proposal_uuid, null: false
      t.string :token, null: false
      t.bigint :total_votes
      t.bigint :total_voters
      t.bigint :total_voting_power
      t.bigint :total_voting_power_used
      t.bigint :total_voting_power_not_used
      t.bigint :total_voting_power_abstain
      t.bigint :total_voting_power_no
      t.bigint :total_voting_power_yes
      t.bigint :total_voting_power_abstain_percent
      t.bigint :total_voting_power_no_percent
      t.bigint :total_voting_power_yes_percent
      t.bigint :total_voting_power_used_percent
      t.bigint :total_voting_power_not_used_percent
      t.float :quorum
      t.bigint :quorum_percent
      t.boolean :quorum_reached
      t.string :status
      t.timestamps
    end
  end
end
