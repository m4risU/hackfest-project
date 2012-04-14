class Location < ActiveRecord::Base
  attr_accessible :lat, :lng, :route_id, :vstop
  validates_presence_of :lat, :lng, :route_id
  belongs_to :route

  def self.find_close_to(location)
    lat = location[:lat]
    lng = location[:lng]

    Location.
        select("*, 3956 * 2 * ASIN(SQRT(POWER(SIN((#{lat} - lat) * pi()/180 / 2), 2) + COS(#{lat} * pi()/180) * COS(lat * pi()/180) * POWER(SIN((#{lng} - lng) * pi()/180 / 2), 2))) AS distance").
        where(:vstop => true).
        order("distance DESC").
        limit(3)
  end

  def to_s
    "define me..."
  end
end
