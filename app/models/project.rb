class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_one_attached :image
  has_and_belongs_to_many :users

  def team_lead
    if self.team_lead_user_id
      User.find(self.team_lead_user_id)
    end
  end

  def team_lead=(user)
    self.team_lead_user_id = user.id
  end
end
