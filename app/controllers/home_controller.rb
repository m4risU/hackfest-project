class HomeController < ApplicationController

  skip_before_filter :verify_authenticity_token, :except => [:nearby]

  def index

  end

  def nearby
    @locations = Location.find_close_to(params[:location])
    render :layout => false
  end

end