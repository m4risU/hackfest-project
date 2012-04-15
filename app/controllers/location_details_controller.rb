class LocationDetailsController < ApplicationController
  def index
    @location = Location.find(params[:id])
    @routes = @location.routes
    render :layout => false
  end
end