class Api::V1::InvitationsController < Devise::InvitationsController

  include InvitableMethods
  before_action :authenticate_user!, only: :create
  before_action :resource_from_invitation_token, only: [:edit, :update]

  def create
    debugger
    User.invite!(invite_params, current_api_v1_user)
    render json: { success: ["User created."] }, status: :created
  end

  def edit
    redirect_to "#{client_api_url}?invitation_token=#{params[:invitation_token]}"
  end

  def update
    user = User.accept_invitation!(accept_invitation_params)
    if @user.errors.empty?
      render json: { success: ["User updated."] }, status: :accepted
    else
      render json: { errors: user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def invite_params
    params.permit(user: [:email])
  end

  def accept_invitation_params
    params.permit(:password, :password_confirmation, :invitation_token)
  end
end
