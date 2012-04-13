class LocationsController < ApplicationController

  before_filter :fetch_route

  def create
    location = @route.locations.new(params[:location])
    if location.save
      render :text => "ok", :status => 201
    else
      render :text => location.errors.first
    end
  end

  private
  def fetch_route
    @route = Route.find(params[:route_id])
  end
end