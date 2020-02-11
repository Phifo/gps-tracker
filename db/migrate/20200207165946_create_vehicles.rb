class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :identifier
      t.string :device_serial_number

      t.timestamps
    end
  end
end
