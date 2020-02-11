# frozen_string_literal: true

class RemoveColumnsFromRoutes < ActiveRecord::Migration[6.0]
  def change
    remove_column :routes, :origin, :st_point

    remove_column :routes, :destination, :st_point

    remove_column :routes, :boundaries, :st_polygon
  end
end
