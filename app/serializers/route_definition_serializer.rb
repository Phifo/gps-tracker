# frozen_string_literal: true

class RouteDefinitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :origin, :destination
end
