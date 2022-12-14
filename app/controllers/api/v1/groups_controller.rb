class Api::V1::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[ show update destroy ]

  # GET /groups
  def index
    @groups = current_user.groups.all
    authorize @groups

    render json: @groups
  end

  # GET /groups/1
  def show
    render json: @group
  end

  # POST /groups
  def create
    @group = current_user.groups.new(group_params)
    authorize @group

    if @group.save
      render json: @group, status: :created
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  def update
    authorize @group
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    authorize @group

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = current_user.groups.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(
        :name,
        payers_attributes: [
          :user_id,
        ]
      )
    end
end
