class User < ApplicationRecord
  authenticates_with_sorcery!


  has_one_attached :image

  has_and_belongs_to_many :projects

  validates_length_of :password, minimum: 3, message: 'password must be at least 3 characters long', if: :password
  validates_confirmation_of :password, message: 'should match confirmation', if: :password

end
