class CreateProjectsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_users, id: false do |t|
      t.belongs_to :project
      t.belongs_to :user

      t.timestamps
    end
  end
end
