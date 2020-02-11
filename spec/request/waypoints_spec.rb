# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Waypoints', type: :request do
  describe 'POST /api/v1/waypoints' do
    let!(:route_definition) { create(:route_definition, name: 'Santiago => Peor es Nada') }
    let!(:vehicle) { create(:vehicle, identifier: 'AABB12', device_serial_number: 'd131dd02c5e6eec4') }
    let(:valid_params) do
      {
        device_serial_number: 'd131dd02c5e6eec4',
        latitude: -70.69075584411621,
        longitude: -33.45382270754665
      }
    end
    let(:invalid_params) do
      {
        latitude: -70.69075584411621,
        longitude: -33.45382270754665
      }
    end

    it 'creates a waypoint' do
      expect do
        post api_v1_waypoints_path(params: valid_params)
      end.to change(Waypoint, :count).by(1)
    end

    it 'returns created status' do
      post api_v1_waypoints_path(params: valid_params)

      expect(response).to have_http_status(201)
    end
  end
end
