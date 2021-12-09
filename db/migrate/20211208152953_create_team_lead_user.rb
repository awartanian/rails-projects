class CreateTeamLeadUser < ActiveRecord::Migration[6.1]
  def change
    create_table :team_lead_user do |t|
      t.string :name
      t.string :email

      t.references :project

      t.timestamps
    end
  end
end
