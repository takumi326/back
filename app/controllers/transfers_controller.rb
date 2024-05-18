class TransfersController < ApplicationController
    before_action :set_transfer, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
    
    def index
      @transfers = Transfer.left_outer_joins(:account)
      .where(user_id: current_api_v1_user.id)
      .select('transfers.*, accounts.name AS after_account_name')
    
      render json: @transfers
    end
    
    def create
      @transfer = Transfer.new(transfer_params.merge(user_id: current_api_v1_user.id))
    
      if @transfer.save
        render json: @transfer, status: :created, location: @transfer
      else
        render json: @transfer.errors, status: :unprocessable_entity
      end
    end
    
    def update
      if @transfer.update(transfer_params)
        render json: @transfer
      else
        render json: @transfer.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @transfer.destroy
    end
    
    private
      def set_transfer
        @transfer = Transfer.find(params[:id])
      end
    
      def transfer_params
        params.require(:transfer).permit(:before_account_id,:after_account_id, :amount, :schedule,
        :repetition, :repetition_type, :body, repetition_settings: [])
      end
end
