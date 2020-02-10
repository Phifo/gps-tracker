# frozen_string_literal: true

class Route < ApplicationRecord
  include Filterable

  belongs_to :vehicle
  belongs_to :route_definition

  enum status: %i[finalized on_route incomplete]

  filter :route_name, lambda { |name|
                        joins(:route_definition)
                          .where(route_definitions: { name: name })
                      }
  filter :date, ->(date) { where(started_at: date) }
  filter :vehicle_identifier, lambda { |identifier|
                                joins(:vehicle)
                                  .where(vehicles: { identifier: identifier })
                              }
end
