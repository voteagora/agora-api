# == Schema Information
#
# Table name: proposals
#
#  id            :bigint           not null, primary key
#  uuid          :string           not null
#  proposer_addr :string           not null
#  token         :string           not null
#  targets       :text
#  values        :text
#  signatures    :text
#  calldata      :text
#  start_block   :bigint
#  end_block     :bigint
#  description   :text
#  kind          :string           default("agora_standard")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class ProposalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
