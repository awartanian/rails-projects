class UsersController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @user = @project.users.new(user_params)

    if @user.save
      flash.notice = "Added user"
      redirect_to project_path(@project)
    else
      flash.alert = "Cannot create user"
      redirect_to project_path(@project)
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @user = @project.users.find(params[:id])

    if @user.destroy
      flash.notice = "Deleted user"
      redirect_to project_path(@project)
    else
      flash.alert = "Cannot delete user"
      redirect_to project_path(@project)
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :title,
      :name,
      :email
    )
  end
end
