Rails.application.routes.draw do
  resources :tasks, only: [:index, :create]
  patch 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
end

class TasksController < ApplicationController
  def complete
    @task = Task.find(params[:id])
    @task.update(status: 1)  # เปลี่ยนสถานะเป็น complete
    redirect_to tasks_path
  end
end
