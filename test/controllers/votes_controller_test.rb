require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote = votes(:one)
  end

  test "should get index" do
    get votes_url, as: :json
    assert_response :success
  end

  test "should create vote" do
    assert_difference("Vote.count") do
      post votes_url, params: { vote: { address: @vote.address, amount: @vote.amount, proposal_uuid: @vote.proposal_uuid, reason: @vote.reason, support: @vote.support, token: @vote.token } }, as: :json
    end

    assert_response :created
  end

  test "should show vote" do
    get vote_url(@vote), as: :json
    assert_response :success
  end

  test "should update vote" do
    patch vote_url(@vote), params: { vote: { address: @vote.address, amount: @vote.amount, proposal_uuid: @vote.proposal_uuid, reason: @vote.reason, support: @vote.support, token: @vote.token } }, as: :json
    assert_response :success
  end

  test "should destroy vote" do
    assert_difference("Vote.count", -1) do
      delete vote_url(@vote), as: :json
    end

    assert_response :no_content
  end
end
