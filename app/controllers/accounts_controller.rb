class AccountsController < ApplicationController
    before_action :set_account, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
  
    def index
      @accounts = Account.where(user_id: current_api_v1_user.id)
  
      render json: @accounts
    end
  
    def create
      @account = Account.new(account_params.merge(user_id: current_api_v1_user.id))
  
      if @account.save
        render json: @account, status: :created, location: @account
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @account.update(account_params)
        render json: @account
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @account.destroy
    end
  
    private
      def set_account
        @account = Account.find(params[:id])
      end
  
      def account_params
        params.require(:account).permit(:name,:amount,:body)
      end
end
