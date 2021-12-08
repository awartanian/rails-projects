
class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  # 1..N
  has_many :users
end
