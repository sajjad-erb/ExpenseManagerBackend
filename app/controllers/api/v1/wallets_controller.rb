class Api::V1::WalletsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_wallet, only: %i[ show update destroy ]

  # GET /wallets
  def index
    render json: current_user.wallet
  end

  # # GET /wallets/1
  # def show
  #   render json: current_user.wallet
  #   authorize @wallet
  # end

  # POST /wallets
  # def create
  #   @wallet = current_user.wallet.new(wallet_params)
  #   # @wallet.user = current_user

  #   if @wallet.save
  #     render json: @wallet, status: :created, location: @wallet
  #   else
  #     render json: @wallet.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /wallets/1
  # def update
  #   authorize @wallet
  #   if @wallet.update(wallet_params)
  #     render json: @wallet
  #   else
  #     render json: @wallet.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /wallets/1
  # def destroy
  #   authorize @wallet
  #   @wallet.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_wallet
  #     @wallet = current_user.wallets.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def wallet_params
  #     params.fetch(:wallet, {}).permit!
  #   end
end
