class LocationsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  before_filter :fetch_route

  def create
    location = @route.locations.new(params[:location])
    if location.save
      render :text => "ok", :status => 201
    else
      render :text => location.errors.first
    end
  end

  def index
    @locations = @route.locations
    render :layout => false
  end

  def destroy
    location = @route.locations.find(params[:id])
    location.destroy
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

  private
  def fetch_route
    @route = Route.find(params[:route_id])
  end
end