class UpdatesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @update = @project.updates.new(update_params)

    if @update.save
      flash.notice = "Added update"
      redirect_to project_path(@project)
    else
      flash.alert = "Cannot create update"
      redirect_to project_path(@project)
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @update = @project.updates.find(params[:id])

    if @update.destroy
      flash.notice = "Deleted update"
      redirect_to project_path(@project)
    else
      flash.alert = "Cannot delete update"
      redirect_to project_path(@project)
    end
  end

  private

  def update_params
    params.require(:update).permit(
      :text,
      :image
    )
  end
end
