class TeamLeadUserController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @team_lead_user = @project.team_lead_user.new(team_lead_user_params)

    if @team_lead_user.save
      flash.notice = "Added team_lead_user"
      redirect_to project_path(@project)
    else
      flash.alert = "Cannot create team_lead_user"
      redirect_to project_path(@project)
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @team_lead_user = @project.team_lead_user.find(params[:id])

    if @team_lead_user.destroy
      flash.notice = "Deleted team_lead_user"
      redirect_to project_path(@project)
    else
      flash.alert = "Cannot delete team_lead_user"
      redirect_to project_path(@project)
    end
  end

  private

  def team_lead_user_params
    params.require(:team_lead_user).permit(
      :title,
      :name,
      :email
    )
  end
end
