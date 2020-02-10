class CreateRouteDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :route_definitions do |t|
      t.string :name
      t.st_polygon :boundaries
      t.st_point :origin
      t.st_point :destination

      t.timestamps
    end
  end
end
