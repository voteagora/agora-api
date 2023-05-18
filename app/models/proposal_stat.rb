# == Schema Information
#
# Table name: proposal_stats
#
#  id                                  :bigint           not null, primary key
#  proposal_uuid                       :string           not null
#  token                               :string           not null
#  total_votes                         :bigint
#  total_voters                        :bigint
#  total_voting_power                  :bigint
#  total_voting_power_used             :bigint
#  total_voting_power_not_used         :bigint
#  total_voting_power_abstain          :bigint
#  total_voting_power_no               :bigint
#  total_voting_power_yes              :bigint
#  total_voting_power_abstain_percent  :bigint
#  total_voting_power_no_percent       :bigint
#  total_voting_power_yes_percent      :bigint
#  total_voting_power_used_percent     :bigint
#  total_voting_power_not_used_percent :bigint
#  quorum                              :float
#  quorum_percent                      :bigint
#  quorum_reached                      :boolean
#  status                              :string
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
class ProposalStat < ApplicationRecord
end
