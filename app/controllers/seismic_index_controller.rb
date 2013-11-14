class SeismicIndexController < ApplicationController
  require 'open-uri'

def index
  # Written by Liam
  # Refactored by Chris
    @quake_data = getEarthquakes(params[:duration], params[:intensity])
    @latest_quake = if @quake_data && @quake_data['metadata']['count'] != 0 && @quake_data['features'].any?
                      @quake_data['features'][0]
                    else
                      false;
                    end
    unless session[:user_id].nil?
      @user = User.find(session[:user_id])
    else
      @user = false;
    end
  end

  def json
    # Written by Chris
    @quake_data = getEarthquakes(params[:duration], params[:intensity])
    render json: @quake_data
  end

  def getEarthquakes(duration, intensity)
    # USGS Data Feed retrieval
    # Written by Liam
    # Refactored by Chris

    # Default values
    duration ||= 'day'
    intensity ||= 'all'

    # Check values of both are allowed
    unless %w(hour day week month).include?(duration) && %w(all 1.0 2.5 4.5 significant).include?(intensity)
      return false;
    end

    json_url = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/%s_%s.geojson" % [intensity, duration]

    return JSON.parse(open(json_url).read)
  end

end
