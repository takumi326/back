class CompletedRepetitionTasksController < ApplicationController
    before_action :set_completed_repetition_task, only: %i[ show update destroy ]
    before_action :authenticate_api_v1_user!
    
    def index
      @completed_repetition_tasks = CompletedRepetitionTask.all
    
      render json: @completed_repetition_tasks
    end
    
    def create
      @completed_repetition_task = CompletedRepetitionTask.new(completed_repetition_task_params)
    
      if @completed_repetition_task.save
        render json: @completed_repetition_task, status: :created
      else
        render json: @completed_repetition_task.errors, status: :unprocessable_entity
      end
    end
    
    def update
      if @completed_repetition_task.update(completed_repetition_task_params)
        render json: @completed_repetition_task
      else
        render json: @completed_repetition_task.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @completed_repetition_task.destroy
    end
    
    private
      def set_completed_repetition_task
        @completed_repetition_task = CompletedRepetitionTask.find(params[:id])
      end
    
      def completed_repetition_task_params
        params.require(:completed_repetition_task).permit(:task_id, :completed_date, :completed, :time)
      end
end
