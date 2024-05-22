class ClassificationMonthlyamountsController < ApplicationController
    before_action :set_classification_monthlyamount, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
    
    def index
      @classification_monthlyamounts = ClassificationMonthlyamount.where(user_id: current_api_v1_user.id)
    
      render json: @classification_monthlyamounts
    end
    
    def create
      @classification_monthlyamount = ClassificationMonthlyamount.new(classification_monthlyamount_params.merge(user_id: current_api_v1_user.id))
    
      if @classification_monthlyamount.save
        render json: @classification_monthlyamount, status: :created, location: @classification_monthlyamount
      else
        render json: @classification_monthlyamount.errors, status: :unprocessable_entity
      end
    end
    
    def update
      if @classification_monthlyamount.update(classification_monthlyamount_params)
        render json: @classification_monthlyamount
      else
        render json: @classification_monthlyamount.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @classification_monthlyamount.destroy
    end
    
    private
      def set_classification_monthlyamount
        @classification_monthlyamount = ClassificationMonthlyamount.find(params[:id])
      end
    
      def classification_monthlyamount_params
        params.require(:classification_monthlyamount).permit(:classification_id, :month, :amount)
      end
end
