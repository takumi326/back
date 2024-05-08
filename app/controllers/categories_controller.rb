class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
  
    def index
      @categories = Category.where(user_id: current_api_v1_user.id)
  
      render json: @categories
    end
  
    def create
      @category = Category.new(category_params.merge(user_id: current_api_v1_user.id))
  
      if @category.save
        render json: @category, status: :created, location: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @category.update(category_params)
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @category.destroy
    end
  
    private
      def set_category
        @category = Category.find(params[:id])
      end
  
      def category_params
        params.require(:category).permit(:name,:category_type)
      end
end
