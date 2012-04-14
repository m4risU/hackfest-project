class Route < ActiveRecord::Base
  attr_accessible :key, :name
  has_many :locations, :order => "route_connections.created_at DESC", :through => :route_connections, :source => :location
  has_many :route_connections

  def to_s
    name
  end
end
