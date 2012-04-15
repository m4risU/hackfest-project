class Location < ActiveRecord::Base
  attr_accessible :lat, :lng, :vstop, :name
  validates_presence_of :lat, :lng
  has_many :routes, :through => :route_connections, :source => :route

  has_many :route_connections
  has_many :departures

  scope :full, lambda { where :vstop => true }

  def self.find_close_to(location)
    lat = location[:lat]
    lng = location[:lng]

    Location.
        select("*, 3956 * 2 * ASIN(SQRT(POWER(SIN((#{lat} - lat) * pi()/180 / 2), 2) + COS(#{lat} * pi()/180) * COS(lat * pi()/180) * POWER(SIN((#{lng} - lng) * pi()/180 / 2), 2))) AS distance").
        where(:vstop => true).
        order("distance ASC").
        limit(3)
  end

  def to_s
    name
  end

  def departing_soon(route)
    departures.where(:route_id => route.id).where("departing_at >= ?", Time.zone.now + 2.hours).map { |departure|
      departure.to_s
    }[0..2].join(", ")
  end

  def departing_locations
    self.class.where(:id => departing_routes.flatten)
  end

  def departing_routes
    routes.map do |route|
      route.locations.full.map(&:id)
    end
  end

end
