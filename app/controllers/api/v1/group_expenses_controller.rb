class Api::V1::GroupExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group_expense, only: %i[ show update destroy ]

  def index
    @group_expenses = current_user.group_expenses.all
    authorize @group_expenses

    render json: @group_expenses
  end

  def show
    render json: @group_expense
  end

  def create
    @group_expense = current_user.group_expenses.new(group_expense_params)
    authorize @group_expense
    if @group_expense.save
      render json: @group_expense, status: :created
    else
      render json: @group_expense.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @group_expense
    if @group_expense.update(group_expense_params)
      render json: @group_expense
    else
      render json: @group_expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @group_expense
    @group_expense.destroy
  end

  private

  def set_group_expense
    @group_expense = current_user.group_expenses.find(params[:id])
  end

  def group_expense_params
    params.require(:group_expense).permit(
      :amount,
      :group_id,
      :category,
      :split,
      payers_attributes: [
        :user_id,
        :paid,
        :payable,
      ],
    )
  end
end
