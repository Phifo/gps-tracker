# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    identifier { 'AABB11' }
    device_serial_number { 'aaaa1111bbbb2222' }
  end
end
