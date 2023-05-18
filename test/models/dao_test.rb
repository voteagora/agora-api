# == Schema Information
#
# Table name: daos
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  token      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class DaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
