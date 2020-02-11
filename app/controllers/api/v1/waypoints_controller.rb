# frozen_string_literal: true

module Api
  module V1
    class WaypointsController < ApplicationController
      before_action :set_vehicle

      def create
        waypoint = Waypoint.new
        waypoint.point = "POINT (#{waypoint_params[:latitude]} #{waypoint_params[:longitude]})"
        route = get_route(waypoint.point)
        waypoint.route = route

        if waypoint.save
          route.check_and_change_status(waypoint.point)

          render json: waypoint, status: :created
        else
          render json: waypoint.errors
        end
      end

      private

      def set_vehicle
        @vehicle = Vehicle.find_by!(
          device_serial_number: waypoint_params[:device_serial_number]
        )
      end

      def get_route(point)
        Route.find_or_create_by_waypoint(
          @vehicle,
          point
        )
      end

      def waypoint_params
        params.permit(:device_serial_number, :latitude, :longitude)
      end
    end
  end
end
