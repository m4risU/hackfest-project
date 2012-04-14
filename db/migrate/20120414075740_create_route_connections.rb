class CreateRouteConnections < ActiveRecord::Migration
  def change
    create_table :route_connections do |t|
      t.integer :location_id
      t.integer :route_id

      t.timestamps
    end
  end
end
