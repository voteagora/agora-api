# == Schema Information
#
# Table name: votes
#
#  id            :bigint           not null, primary key
#  address       :string           not null
#  proposal_uuid :string           not null
#  token         :string           not null
#  support       :integer          not null
#  amount        :float            not null
#  reason        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
