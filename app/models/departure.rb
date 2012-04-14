class Departure < ActiveRecord::Base
  attr_accessible :departing_at, :location_id, :route_id
end
