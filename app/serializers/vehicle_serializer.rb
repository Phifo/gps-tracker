# frozen_string_literal: true

class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :identifier, :device_serial_number
end
