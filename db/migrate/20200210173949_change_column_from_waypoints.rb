class ChangeColumnFromWaypoints < ActiveRecord::Migration[6.0]
  def change
    change_column :waypoints, :point, :st_point, geographic: true
  end
end
