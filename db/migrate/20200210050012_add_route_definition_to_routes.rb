class AddRouteDefinitionToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_reference :routes, :route_definition, null: false, foreign_key: true
  end
end
