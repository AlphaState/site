class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  attr_accessor :password_digest
  has_secure_password validations: false
  validates :password, presence: true, on: :create
end
