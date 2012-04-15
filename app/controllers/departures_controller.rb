class DeparturesController < ApplicationController

  before_filter :fetch_route
  before_filter :fetch_location

  def index
    @departures = Departure.where(:location_id => @location.id, :route_id => @route.id).order("departing_at ASC")
    render :layout => false
  end

  def create
    times = params[:departures].gsub(" ", "").gsub("\"", "").gsub("\n", ",").split(",")
    times.each do |time_elem|
      @location.departures.create(:departing_at => time_elem, :route_id => @route.id)
    end
    render :text => "ok", :status => 201
  end

  def destroy
    departure = Departure.where(:location_id => @location.id, :route_id => @route.id, :id => params[:id]).first
    departure.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {
        render :partial => 'destroy'
      }
    end
  end

  def details
    @departures = Departure.where(:location_id => @location.id, :route_id => @route.id).order("departing_at ASC")
    render :layout => false
  end

  private
  def fetch_route
    @route = Route.find(params[:route_id])
  end

  def fetch_location
    @location = @route.locations.find(params[:location_id])
  end

end