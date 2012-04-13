class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.boolean :vstop
      t.string :lat
      t.string :lng
      t.integer :route_id

      t.timestamps
    end
  end
end
