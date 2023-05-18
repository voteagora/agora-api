# == Schema Information
#
# Table name: delegations
#
#  id             :bigint           not null, primary key
#  delegator_addr :string           not null
#  delegatee_addr :string           not null
#  token          :string           not null
#  amount         :float            not null
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class DelegationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
