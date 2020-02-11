# frozen_string_literal: true

class RouteDefinition < ApplicationRecord
  has_many :routes

  validates :name, presence: true
  validates :boundaries, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
end
