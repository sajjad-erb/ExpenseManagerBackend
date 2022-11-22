class Api::V1::AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[ show update destroy ]

  # GET /accounts
  def index
    @accounts = current_user.accounts
    # @accounts = Account.all
    authorize @accounts
    render json: @accounts
  end

  # GET /accounts/1
  def show
    authorize @account
    render json: @account
  end

  # POST /accounts
  def create
    @account = current_user.accounts.new(account_params)
  
    authorize @account
    # @account.user = current_user
    if @account.save # return true/false
      render json: @account, status: :created
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  def update
    authorize @account
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  def destroy
    authorize @account
    @account.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = current_user.accounts.find(params[:id])
    # @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.permit(:account_no, :account_title, :balance, :user_id)
  end
end
