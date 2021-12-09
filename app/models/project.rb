
class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  # 1..N
  has_many :users

  # 1..1
  #has_one :team_lead_user

  has_one_attached :image
end
