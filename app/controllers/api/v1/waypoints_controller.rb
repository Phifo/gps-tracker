# frozen_string_literal: true

module Api
  module V1
    class WaypointsController < ApplicationController
      def create
        waypoint = Waypoint.new
        waypoint.point = "POINT (#{waypoint_params[:latitude]} #{waypoint_params[:longitude]})"
        waypoint.route = get_route(waypoint)

        if waypoint.save
          check_status(waypoint.route, waypoint)

          render json: waypoint, status: :created
        else
          render json: waypoint.errors
        end
      end

      private

      def get_route(waypoint)
        vehicle = Vehicle.find_by!(device_serial_number: waypoint_params[:device_serial_number])
        route = vehicle.routes.find_by(ended_at: nil)

        return route if route.present?

        route_definition = RouteDefinition.find_by!(
          'ST_Distance(origin, ?) <= 100',
          waypoint.point
        )

        route_definition.routes.create!(vehicle: vehicle,
                                        started_at: Time.now,
                                        status: 'on_route')
      end

      def check_status(route, waypoint)
        distance = route.route_definition.destination.distance(waypoint.point)

        route.update(status: 'finalized', ended_at: Time.now) if distance <= 100
      end

      def waypoint_params
        params.permit(:device_serial_number, :latitude, :longitude)
      end
    end
  end
end
