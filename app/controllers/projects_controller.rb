class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @task = Task.new
    @backlog = @project.tasks.backlog
    @in_progress = @project.tasks.in_progress
    @completed = @project.tasks.completed
    @invite = Invite.new
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    
    if project.save

      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to :back
  end

private
  def project_params
    params.require(:project).permit(:name,
                                    :description,
                                    :owner_id
                                    )
  end
end
