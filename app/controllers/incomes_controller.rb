class IncomesController < ApplicationController
    before_action :set_income, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
    
    def index
      @incomes = Income.left_outer_joins(:account)
      .where(user_id: current_api_v1_user.id)
      .select('incomes.*, category.id AS category_id, category.name AS category_name,
      classification.id AS classification_id, classification.name AS classification_name')
    
      render json: @incomes
    end
    
    def create
      @income = Income.new(income_params.merge(user_id: current_api_v1_user.id))
    
      if @income.save
        render json: @income, status: :created, location: @income
      else
        render json: @income.errors, status: :unprocessable_entity
      end
    end
    
    def update
      if @income.update(income_params)
        render json: @income
      else
        render json: @income.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @income.destroy
    end
    
    private
      def set_income
        @income = Income.find(params[:id])
      end
    
      def income_params
        params.require(:income).permit(:category.id, :classification_id, :amount, :schedule, 
        :repetition, :repetition_type, :body,repetition_settings: [])
      end
end
