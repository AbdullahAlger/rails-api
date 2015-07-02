class User < ActiveRecord::Base

  has_many :lists


  validates :username, presence: true
  has_secure_password
  validates :password, length: { minimum: 1 }, presence: true


end
