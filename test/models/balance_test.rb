# == Schema Information
#
# Table name: balances
#
#  id         :bigint           not null, primary key
#  address    :string           not null
#  token      :string           not null
#  amount     :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class BalanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
