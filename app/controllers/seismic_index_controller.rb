class SeismicIndexController < ApplicationController

	def index
		if request.xhr?
      data = getData('day')
			render :json => {:file_content => data}
			#@script.fileContent
		end
	end

	def fileContent
		#@script = Script.where(:script_file_name => params[:file_name]).first # file_name is the data key of Ajax request in view

		if request.xhr?
			render :json => {:file_content => "AJAX DATA"}
			#@script.fileContent
		end
	end


  require 'open-uri'

  def getEarthquakes(duration)
    case duration
      when "month"
        json_url = URI.encode("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson")
      when "week"
        json_url = URI.encode("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson")
      when "day"
        json_url = URI.encode("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")
      when "hour"
        json_url = URI.encode("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson")
    end

    @earthquakes_hash = JSON.parse(open(json_url).read)
  end

  def getData(duration)
    getEarthquakes(duration)
    length=@earthquakes_hash["features"].length
    @print_string = ""
    #------------------------------------------------------------test-------------------------------------------------------------------------------------------------------
    for i in 0...length
      @print_string = @print_string + @earthquakes_hash["features"][i]["properties"]["mag"].to_s + "\n"
    end
    #------------------------------------------------------------test-------------------------------------------------------------------------------------------------------
    #@json_object = NET::HTTP.get_response("earthquake.usgs.gov","/earthquakes/feed/v1.0/summary/all_week.geojson")
  end

end
