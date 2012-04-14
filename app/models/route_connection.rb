class RouteConnection < ActiveRecord::Base
  attr_accessible :location_id, :route_id
  belongs_to :location
  belongs_to :route
end
