class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  default_scope {order("item ASC")}

  validates :user, presence: true
  validates :description, presence: true
  validates :name, presence: true

end
