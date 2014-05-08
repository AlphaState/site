class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password validations: false
  validates :password, presence: true, on: :create
end
