class CreateDepartures < ActiveRecord::Migration
  def change
    create_table :departures do |t|
      t.time :departing_at
      t.integer :location_id
      t.integer :route_id

      t.timestamps
    end
  end
end
