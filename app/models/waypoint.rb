class Waypoint < ApplicationRecord
  belongs_to :route

  validates :point, presence: true
end
