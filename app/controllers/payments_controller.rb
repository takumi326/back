class PaymentsController < ApplicationController
    before_action :set_payment, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
    
    def index
      @payments = Payment.left_outer_joins(:category, :classification)
      .where(user_id: current_api_v1_user.id)
      .select('payments.*, categories.id AS category_id, categories.name AS category_name,
      classifications.id AS classification_id, classifications.name AS classification_name')
    
      render json: @payments
    end
    
    def create
      @payment = Payment.new(payment_params.merge(user_id: current_api_v1_user.id))
    
      if @payment.save
        render json: @payment, status: :created, location: @payment
      else
        render json: @payment.errors, status: :unprocessable_entity
      end
    end
    
    def update
      if @payment.update(payment_params)
        render json: @payment
      else
        render json: @payment.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @payment.destroy
    end
    
    private
      def set_payment
        @payment = Payment.find(params[:id])
      end
    
      def payment_params
        params.require(:payment).permit(:category.id, :classification_id, :amount, :schedule, 
        :repetition, :repetition_type, :body,repetition_settings: [])
      end
end
