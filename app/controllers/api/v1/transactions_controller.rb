class Api::V1::TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: %i[ show update destroy ]

  # GET /transactions
  def index
    @transactions = current_user.transactions.paginate(:page => params[:page])
    # @transactions = current_user.transaction.all
    authorize @transactions
    render json: @transactions
  end 

  # GET /transactions/1
  def show
    authorize @transaction
    render json: @transaction
  end

  # POST /transactions
  def create
    @transaction = current_user.transactions.new(transaction_params)
    authorize @transaction
    ActiveRecord::Base.transaction do
      do_transaction
      @transaction.save
      raise if @transaction.errors.present? || @transaction.transfer_to&.errors&.present? || @transaction.transfer_from&.errors&.present?
      render json: @transaction, status: :created
    end
  rescue
    errors = {}
    errors[:transaction] = @transaction.errors if @transaction.present?
    errors[:transfer_to] = @transaction.transfer_to.errors if @transaction.transfer_to&.errors&.present?
    errors[:transfer_from] = @transaction.transfer_from.errors if @transaction.transfer_from&.errors&.present?
    render json: errors
  end

  # PATCH/PUT /transactions/1
  def update
    authorize @transaction
    ActiveRecord::Base.transaction do
      undo_transaction
      @transaction.assign_attributes(transaction_params)
      do_transaction
      @transaction.save
      raise if @transaction.errors.present? || @transaction.transfer_to&.errors&.present? || @transaction.transfer_from&.errors&.present?
      render json: @transaction
    end
  rescue
    errors = {}
    errors[:transaction] = @transaction.errors if @transaction.present?
    errors[:transfer_to] = @transaction.transfer_to.errors if @transaction.transfer_to&.errors&.present?
    errors[:transfer_from] = @transaction.transfer_from.errors if @transaction.transfer_from&.errors&.present?
    render json: errors
  end

  # DELETE /transactions/1
  def destroy
    authorize @transaction
    ActiveRecord::Base.transaction do
      undo_transaction
      @transaction.destroy!
      raise if @transaction.errors.present? || @transaction.transfer_to&.errors&.present? || @transaction.transfer_from&.errors&.present?
      render status: :ok
    end
  rescue
    errors = {}
    errors[:transaction] = @transaction.errors if @transaction.present?
    errors[:transfer_to] = @transaction.transfer_to.errors if @transaction.transfer_to&.errors&.present?
    errors[:transfer_from] = @transaction.transfer_from.errors if @transaction.transfer_from&.errors&.present?
    render json: errors
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
      parameter = params.fetch(:transaction, {}).permit!
      parameter[:transfer_from_id] = current_user.wallet.id if parameter[:transfer_from_type].present? && parameter[:transfer_from_type] == "Wallet"
      parameter[:transfer_to_id] = current_user.wallet.id if parameter[:transfer_to_type].present? && parameter[:transfer_to_type] == "Wallet"
      parameter
    end


  # def do_transaction
  #   if @transaction.type == "Income"
  #     @transaction.transfer_to.update(balance: @transaction.transfer_to.balance + @transaction.amount)
  #   elsif @transaction.type == "BankTransfer"
  #     @transaction.transfer_from.update(balance: @transaction.transfer_from.balance - @transaction.amount)
  #     @transaction.transfer_to.update(@transaction.transfer_to.balance + @transaction.amount)
  #   elsif @transaction.type == "Expense"
  #     # if @transaction.amount <= @transaction.transfer_from.balance
  #     @transaction.transfer_from.update(balance: @transaction.transfer_from.balance - @transaction.amount)
  #   end
  # end

  def do_transaction
    if @transaction.type == "Income"
      @transaction.transfer_to.increment(:balance, @transaction.amount).save
    elsif @transaction.type == "BankTransfer"
      @transaction.transfer_from.decrement(:balance, @transaction.amount).save
      @transaction.transfer_to.increment(:balance, @transaction.amount).save
    elsif @transaction.type == "Expense"
      @transaction.transfer_from.decrement(:balance, @transaction.amount).save
    end
  end

  def undo_transaction
    if @transaction.type == "Income"
      @transaction.transfer_to.decrement(:balance, @transaction.amount).save
    elsif @transaction.type == "BankTransfer"
      @transaction.transfer_from.increment(:balance, @transaction.amount).save
      @transaction.transfer_to.decrement(:balance, @transaction.amount).save
    elsif @transaction.type == "Expense"
      # if @transaction.amount <= @transaction.transfer_from.balance
      @transaction.transfer_from.increment(:balance, @transaction.amount).save
    end
  end
end


# parameter[:transfer_from_id] = current_user.wallet.id if parameter[:transfer_from_type].present? && parameter[:transfer_from_type] == "Wallet"
#       parameter[:transfer_to_id] = current_user.wallet.id if parameter[:transfer_to_type].present? && parameter[:transfer_to_type] == "Wallet"
#       parameter