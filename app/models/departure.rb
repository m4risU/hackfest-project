class Departure < ActiveRecord::Base
  attr_accessible :departing_at, :location_id, :route_id

  def to_s
    departing_at.strftime("%H:%M")
    #Time.now.strftime("%H:%M") + "/" +departing_at.strftime("%H:%M")
    #t1 = departing_at
    #t2 = Time.now
    #
    #diff = t2 - t1     # diff in seconds

  end
end
