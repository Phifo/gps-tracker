# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.identifier = 'AABB11'
    subject.device_serial_number = 'd131dd02c5e6eec4'

    expect(subject).to be_valid
  end

  it 'is not valid without a identifier' do
    subject.device_serial_number = 'd131dd02c5e6eec4'
    expect(subject).to_not be_valid
  end

  it 'is not valid without a device_serial_number' do
    subject.identifier = 'AABB11'
    expect(subject).to_not be_valid
  end
end
