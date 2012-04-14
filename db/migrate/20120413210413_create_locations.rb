class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.boolean :vstop
      t.float :lat
      t.float :lng
      t.integer :route_id
      t.string :name

      t.timestamps
    end
  end
end
