class RepetitionMoneiesController < ApplicationController
    before_action :set_repetition_money, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
    
    def index
      @repetition_moneys = RepetitionMoney.all
    
      render json: @repetition_moneys
    end
    
    def create
      @repetition_money = RepetitionMoney.new(repetition_money_params)
    
      if @repetition_money.save
        render json: @repetition_money, status: :created
      else
        render json: @repetition_money.errors, status: :unprocessable_entity
      end
    end
    
    def update
      if @repetition_money.update(repetition_money_params)
        render json: @repetition_money
      else
        render json: @repetition_money.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @repetition_money.destroy
    end
    
    private
      def set_repetition_money
        @repetition_money = RepetitionMoney.find(params[:id])
      end
    
      def repetition_money_params
        params.require(:repetition_money).permit(:payment_id, :income_id, :transfer_id, :transaction_type, :amount, :repetition_schedule)
      end
end
