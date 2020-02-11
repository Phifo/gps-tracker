# frozen_string_literal: true

class Route < ApplicationRecord
  include Filterable

  belongs_to :vehicle
  belongs_to :route_definition
  has_many :waypoints

  enum status: %i[finalized on_route incomplete]

  filter :route_name, lambda { |name|
                        joins(:route_definition)
                          .where(route_definitions: { name: name })
                      }
  filter :date, ->(date) { where(started_at: date.to_date.beginning_of_day..date.to_date.end_of_day) }
  filter :vehicle_identifier, lambda { |identifier|
                                joins(:vehicle)
                                  .where(vehicles: { identifier: identifier })
                              }

  def self.find_or_create_by_waypoint(vehicle, waypoint_point)
    route = vehicle.routes.find_by(ended_at: nil)

    return route if route.present?

    route_definition = RouteDefinition.find_by!(
      'ST_Distance(origin, ?) <= 100',
      waypoint_point
    )

    route_definition.routes.create!(vehicle: vehicle,
                                    started_at: Time.now,
                                    status: 'on_route')
  end

  def check_and_change_status(point)
    distance = route_definition.destination.distance(point)

    update(status: 'finalized', ended_at: Time.now) if distance <= 100
  end
end
