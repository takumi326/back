class ClassificationsController < ApplicationController
    before_action :set_classification, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
    
    def index
      @classifications = Classification.left_outer_joins(:account)
      .where(user_id: current_api_v1_user.id)
      .select('classifications.*, account.id AS account_id, account.name AS account_name')
    
      render json: @classifications
    end
    
    def create
      @classification = Classification.new(classification_params.merge(user_id: current_api_v1_user.id))
    
      if @classification.save
        render json: @classification, status: :created, location: @classification
      else
        render json: @classification.errors, status: :unprocessable_entity
      end
    end
    
    def update
      if @classification.update(classification_params)
        render json: @classification
      else
        render json: @classification.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @classification.destroy
    end
    
    private
      def set_classification
        @classification = Classification.find(params[:id])
      end
    
      def classification_params
        params.require(:classification).permit(:name, :account_id, :amount)
      end
end
