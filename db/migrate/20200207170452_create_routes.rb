class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.st_point :origin
      t.st_point :destination
      t.st_polygon :boundaries
      t.references :vehicle, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :status

      t.timestamps
    end
  end
end
