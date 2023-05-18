require "test_helper"

class ProposalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal = proposals(:one)
  end

  test "should get index" do
    get proposals_url, as: :json
    assert_response :success
  end

  test "should create proposal" do
    assert_difference("Proposal.count") do
      post proposals_url, params: { proposal: { calldata: @proposal.calldata, description: @proposal.description, end_block: @proposal.end_block, kind: @proposal.kind, proposer_addr: @proposal.proposer_addr, signatures: @proposal.signatures, start_block: @proposal.start_block, targets: @proposal.targets, token: @proposal.token, uuid: @proposal.uuid, values: @proposal.values } }, as: :json
    end

    assert_response :created
  end

  test "should show proposal" do
    get proposal_url(@proposal), as: :json
    assert_response :success
  end

  test "should update proposal" do
    patch proposal_url(@proposal), params: { proposal: { calldata: @proposal.calldata, description: @proposal.description, end_block: @proposal.end_block, kind: @proposal.kind, proposer_addr: @proposal.proposer_addr, signatures: @proposal.signatures, start_block: @proposal.start_block, targets: @proposal.targets, token: @proposal.token, uuid: @proposal.uuid, values: @proposal.values } }, as: :json
    assert_response :success
  end

  test "should destroy proposal" do
    assert_difference("Proposal.count", -1) do
      delete proposal_url(@proposal), as: :json
    end

    assert_response :no_content
  end
end
