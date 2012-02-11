class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :station_name

      t.timestamps
    end
  end
end
