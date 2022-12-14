require "test_helper"

class GroupExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_expense = group_expenses(:one)
  end

  test "should get index" do
    get group_expenses_url, as: :json
    assert_response :success
  end

  test "should create group_expense" do
    assert_difference("GroupExpense.count") do
      post group_expenses_url, params: { group_expense: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show group_expense" do
    get group_expense_url(@group_expense), as: :json
    assert_response :success
  end

  test "should update group_expense" do
    patch group_expense_url(@group_expense), params: { group_expense: {  } }, as: :json
    assert_response :success
  end

  test "should destroy group_expense" do
    assert_difference("GroupExpense.count", -1) do
      delete group_expense_url(@group_expense), as: :json
    end

    assert_response :no_content
  end
end
