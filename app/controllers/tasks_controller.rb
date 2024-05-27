class TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]
  before_action :authenticate_api_v1_user!
  
  def index
    @tasks = Task.left_outer_joins(:purpose)
    .where(user_id: current_api_v1_user.id)
    .select('tasks.*, purposes.id AS purpose_id, purposes.title AS purpose_title')
  
    render json: @tasks
  end
  
  def create
    @task = Task.new(task_params.merge(user_id: current_api_v1_user.id))
  
    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @task.destroy
  end
  
  private
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :purpose_id, :schedule, :end_date, :repetition, :repetition_type, :body, :completed, repetition_settings: [])
    end
end

