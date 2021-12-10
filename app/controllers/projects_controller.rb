class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @users = User.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      @project.image.attach(project_params[:image])
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


  def add_user
    @project = Project.find(params[:id])
    @user = User.find(params[:user_id])

    @project.users << @user

    flash.notice = "Added user to project"
    redirect_to project_path(@project)
  end

  def remove_user
    @project = Project.find(params[:id])
    @user = @project.users.find(params[:user_id])

    @project.users.delete(@user)

    flash.notice = "Remvoed user from project"
    redirect_to project_path(@project)
  end

  def make_team_lead
    @project = Project.find(params[:id])
    @user = User.find(params[:user_id])

    @project.team_lead  = @user
    @project.save

    flash.notice = "User is now team lead"
    redirect_to project_path(@project)

  end

private

  def project_params
    params.require(:project).permit(:title, :description, :image)
  end
end
