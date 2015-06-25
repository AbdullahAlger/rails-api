class List < ActiveRecord::Base

  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates_inclusion_of :permissions, in: %w(viewable open), message: "%{value} not valid"

end
