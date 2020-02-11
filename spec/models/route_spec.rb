# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Route, type: :model do
  subject { described_class.new }
  let(:vehicle) { create(:vehicle) }
  let(:route_definition) { create(:route_definition) }

  it 'is valid with valid attributes' do
    subject.vehicle = vehicle
    subject.status = 'on_route'
    subject.route_definition = route_definition

    expect(subject).to be_valid
  end
end
