class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to projects_path
    else
      flash.alert = "Error"
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])

    if @project.destroy
      flash.notice = "Record deleted"
      redirect_to projects_path
    else
      flash.alert = "Can't delete record"
      redirect_to projects_path
    end
  end

private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
