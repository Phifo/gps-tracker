# frozen_string_literal: true

class RouteSerializer < ActiveModel::Serializer
  attributes :id, :started_at, :ended_at, :status

  belongs_to :route_definition
  belongs_to :vehicle
end
