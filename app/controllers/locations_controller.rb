class LocationsController < ApplicationController

  #skip_before_filter :verify_authenticity_token

  before_filter :fetch_route

  def create
    location = Location.new(params[:location])
    if location.save
      @route.route_connections.create(:location_id => location.id)
      render :text => "ok", :status => 201
    else
      render :text => location.errors.first
    end
  end

  def attach
    location = Location.find(params[:id])
    if location.present?
      @route.route_connections.create!(:location_id => location.id)
      render :text => "ok", :status => 201
    else
      render :text => :not_found
    end
  end

  def index
    @locations = @route.locations
    render :layout => false
  end

  def destroy
    location = @route.locations.find(params[:id])
    route_location = @route.route_connections.where(:location_id => location.id).first

    if location.route_connections.count <= 1
      location.destroy
    end
    route_location.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {
        render :partial => 'destroy', :locals => {:route => @route}
      }
    end
  end

  def toggle
    location = @route.locations.find(params[:id])
    location.update_attribute(:vstop, !location.vstop)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {
        render :partial => 'toggle', :locals => {:route => @route}
      }
    end
  end

  def name
    location = @route.locations.find(params[:id])
    location.update_attribute(:name, params[:location][:name])
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {
        render :partial => 'name', :locals => {:route => @route}
      }
    end
  end

  def departures
    location = @route.locations.find(params[:id])
    @departures = Departure.where(:location_id => location.id, :route_id => @route.id)
    respond_to do |format|
      format.html {}
      format.js {
        render :partial => 'departures'
      }
    end
  end

  private
  def fetch_route
    @route = Route.find(params[:route_id])
  end
end