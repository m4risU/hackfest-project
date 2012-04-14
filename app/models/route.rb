class Route < ActiveRecord::Base
  attr_accessible :key, :name
  has_many :locations, :order => "created_at DESC"

  def to_s
    name
  end
end