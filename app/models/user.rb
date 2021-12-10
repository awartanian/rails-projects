class User < ApplicationRecord
  validates :title, presence: true
  validates :name, presence: true

  has_one_attached :image

  has_and_belongs_to_many :projects
end
