class AddTeamLeadUserIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :team_lead_user_id, :integer
  end
end
