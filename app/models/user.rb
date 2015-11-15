class User < ActiveRecord::Base

  has_many :lists
  #has_many :items, through: :lists

  validates :username, presence: true
  has_secure_password
  validates :password, length: { minimum: 1 }, presence: true


end
