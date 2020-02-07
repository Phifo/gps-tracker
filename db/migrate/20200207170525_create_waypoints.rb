class CreateWaypoints < ActiveRecord::Migration[6.0]
  def change
    create_table :waypoints do |t|
      t.st_point :point
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
