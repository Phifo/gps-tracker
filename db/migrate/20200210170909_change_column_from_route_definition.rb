class ChangeColumnFromRouteDefinition < ActiveRecord::Migration[6.0]
  def change
    change_column :route_definitions, :origin, :st_point, geographic: true
    change_column :route_definitions, :destination, :st_point, geographic: true
    change_column :route_definitions, :boundaries, :st_polygon, geographic: true
  end
end
