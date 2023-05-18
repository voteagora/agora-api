require "test_helper"

class DelegationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delegation = delegations(:one)
  end

  test "should get index" do
    get delegations_url, as: :json
    assert_response :success
  end

  test "should create delegation" do
    assert_difference("Delegation.count") do
      post delegations_url, params: { delegation: { amount: @delegation.amount, delegatee_addr: @delegation.delegatee_addr, delegator_addr: @delegation.delegator_addr, status: @delegation.status, token: @delegation.token } }, as: :json
    end

    assert_response :created
  end

  test "should show delegation" do
    get delegation_url(@delegation), as: :json
    assert_response :success
  end

  test "should update delegation" do
    patch delegation_url(@delegation), params: { delegation: { amount: @delegation.amount, delegatee_addr: @delegation.delegatee_addr, delegator_addr: @delegation.delegator_addr, status: @delegation.status, token: @delegation.token } }, as: :json
    assert_response :success
  end

  test "should destroy delegation" do
    assert_difference("Delegation.count", -1) do
      delete delegation_url(@delegation), as: :json
    end

    assert_response :no_content
  end
end
