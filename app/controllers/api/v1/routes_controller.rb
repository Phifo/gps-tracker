# frozen_string_literal: true

module Api
  module V1
    class RoutesController < ApplicationController
      def index
        routes = Route.apply_filter(filter_params)

        render json: routes
      end

      private

      def filter_params
        params.permit(:route_name, :date, :vehicle_identifier)
      end
    end
  end
end
