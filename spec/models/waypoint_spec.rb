# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  subject { described_class.new }
  let(:route) { create(:route) }

  it 'is valid with valid attributes' do
    subject.point = 'POINT (-70.69075584411621 -33.45382270754665)'
    subject.route = route

    expect(subject).to be_valid
  end

  it 'is not valid without a point' do
    expect(subject).to_not be_valid
  end
end
