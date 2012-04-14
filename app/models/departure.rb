class Departure < ActiveRecord::Base
  attr_accessible :departing_at, :location_id, :route_id

  def to_s
    departing_at.strftime("%H:%M")
  end
end
