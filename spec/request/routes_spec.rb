# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Routes', type: :request do
  describe 'GET /api/v1/routes' do
    let(:route_definition) { create(:route_definition, name: 'Santiago => Peor es Nada') }
    let(:route_definition2) { create(:route_definition, name: 'Peor es Nada => Santiago') }
    let(:vehicle) { create(:vehicle, identifier: 'AABB12', device_serial_number: 'd131dd02c5e6eec4') }
    let!(:routes) { create_list(:route, 2, route_definition: route_definition, vehicle: vehicle, started_at: '2020-02-10'.to_datetime) }
    let!(:routes2) { create_list(:route, 3, route_definition: route_definition2, vehicle: vehicle) }

    it 'returns 200 status code' do
      get api_v1_routes_path

      expect(response).to have_http_status(200)
    end

    it 'returns by route_name' do
      get api_v1_routes_path(params: { route_name: 'Santiago => Peor es Nada' })

      expect(JSON.parse(response.body).map { |json| json['id'] }).to match_array(routes.map(&:id))
    end

    it 'returns by vehicle' do
      get api_v1_routes_path(params: { vehicle_identifier: 'AABB12' })

      expect(JSON.parse(response.body).map { |json| json['id'] }).to match_array(routes.map(&:id) + routes2.map(&:id))
    end

    it 'returns by date' do
      get api_v1_routes_path(params: { date: '2020-02-10' })

      expect(JSON.parse(response.body).map { |json| json['id'] }).to match_array(routes.map(&:id))
    end
  end
end
