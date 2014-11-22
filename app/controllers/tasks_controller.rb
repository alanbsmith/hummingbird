class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)

    if task.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to :back
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :back
  end

private
  def task_params
    params.require(:task).permit(:title,
                                 :description,
                                 :status,
                                 :project_id
                                )
  end
end
