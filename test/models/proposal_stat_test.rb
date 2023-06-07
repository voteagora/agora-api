# == Schema Information
#
# Table name: proposal_stats
#
#  id                                  :bigint           not null, primary key
#  proposal_uuid                       :string           not null
#  token                               :string           not null
#  total_votes                         :bigint
#  total_voting_power                  :float
#  total_voting_power_used             :float
#  total_voting_power_not_used         :float
#  total_voting_power_abstain          :float
#  total_votes_for                     :bigint
#  total_votes_against                 :bigint
#  total_votes_abstain                 :bigint
#  total_votes_with_reason             :bigint
#  total_voting_power_no               :float
#  total_voting_power_yes              :float
#  total_voting_power_abstain_percent  :float
#  total_voting_power_no_percent       :float
#  total_voting_power_yes_percent      :float
#  total_voting_power_used_percent     :float
#  total_voting_power_not_used_percent :float
#  quorum                              :float
#  quorum_percent                      :bigint
#  quorum_reached                      :boolean
#  status                              :string
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
require "test_helper"

class ProposalStatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
