class Location < ActiveRecord::Base
  attr_accessible :lat, :lng, :route_id, :vstop
  validates_presence_of :lat, :lng, :route_id
  belongs_to :route
end
