# == Schema Information
#
# Table name: ens_records
#
#  id         :bigint           not null, primary key
#  address    :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class EnsRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
