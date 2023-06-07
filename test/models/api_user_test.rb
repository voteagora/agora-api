# == Schema Information
#
# Table name: api_users
#
#  id          :bigint           not null, primary key
#  api_key     :string
#  expires_at  :datetime
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ApiUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
