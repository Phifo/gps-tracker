# frozen_string_literal: true

class Route < ApplicationRecord
  belongs_to :vehicle

  enum status: %i[finalized on_route incomplete]
end
