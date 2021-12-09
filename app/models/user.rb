class User < ApplicationRecord
  validates :title, presence: true
  validates :name, presence: true
  validates :email, presence: true

  belongs_to :project
end
