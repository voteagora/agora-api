require "test_helper"

class BalancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @balance = balances(:one)
  end

  test "should get index" do
    get balances_url, as: :json
    assert_response :success
  end

  test "should create balance" do
    assert_difference("Balance.count") do
      post balances_url, params: { balance: { address: @balance.address, amount: @balance.amount, token: @balance.token } }, as: :json
    end

    assert_response :created
  end

  test "should show balance" do
    get balance_url(@balance), as: :json
    assert_response :success
  end

  test "should update balance" do
    patch balance_url(@balance), params: { balance: { address: @balance.address, amount: @balance.amount, token: @balance.token } }, as: :json
    assert_response :success
  end

  test "should destroy balance" do
    assert_difference("Balance.count", -1) do
      delete balance_url(@balance), as: :json
    end

    assert_response :no_content
  end
end
