class Route < ActiveRecord::Base
  attr_accessible :key, :name
  has_many :locations
end
