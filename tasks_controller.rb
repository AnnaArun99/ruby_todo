class TasksController < ApplicationController
    def index
      @tasks = Task.where(status: 0)  # แสดงเฉพาะงานที่ incomplete
      @task = Task.new
    end
  end

class TasksController < ApplicationController
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to tasks_path
      else
        render :index
      end
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title, :status)
    end
  end
  
  