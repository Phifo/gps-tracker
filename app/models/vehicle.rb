# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_many :routes

  validates :identifier, presence: true
  validates :device_serial_number, presence: true
end
