class PurposesController < ApplicationController
  before_action :set_purpose, only: %i[ show update destroy ]
  before_action :authenticate_api_v1_user!

  def index
    @purposes = Purpose.where(user_id: current_api_v1_user.id)

    render json: @purposes
  end

  def create
    @purpose = Purpose.new(purpose_params.merge(user_id: current_api_v1_user.id))

    if @purpose.save
      render json: @purpose, status: :created, location: @purpose
    else
      render json: @purpose.errors, status: :unprocessable_entity
    end
  end

  def update
    if @purpose.update(purpose_params)
      render json: @purpose
    else
      render json: @purpose.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @purpose.destroy
  end

  private
    def set_purpose
      @purpose = Purpose.find(params[:id])
    end

    def purpose_params
      params.require(:purpose).permit(:title,:result,:deadline,:body,:completed)
    end
end
