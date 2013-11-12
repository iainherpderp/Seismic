class SeismicIndexController < ApplicationController
  require 'open-uri'

	def index
<<<<<<< HEAD
    @quake_data = getEarthquakes(params[:duration], params[:intensity])
    @latest_quake = if @quake_data && @quake_data['metadata']['count'] != 0 && @quake_data['features'].any?
                      @quake_data['features'][0]
                    else
                      false;
                    end
  end
=======
<<<<<<< HEAD
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
=======
    @quake_data = getData('day')
		if request.xhr?
			render :json => {:file_content => @quake_data}
			#@script.fileContent
    end
>>>>>>> baf625bd0d85a75bb01d9792d742610b79684b57
	end
>>>>>>> refs/remotes/github/master

  def json
    @quake_data = getEarthquakes(params[:duration], params[:intensity])
    render json: @quake_data
  end

  def getEarthquakes(duration, intensity)
    # Default values
    duration ||= 'day'
    intensity ||= 'all'

    # Check values of both are allowed
    unless %w(hour day week month).include?(duration) && %w(all 1.0 2.5 4.5 significant).include?(intensity)
      return false;
    end

    json_url = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/%s_%s.geojson" % [intensity, duration]

<<<<<<< HEAD
    return JSON.parse(open(json_url).read)
=======
  def getData(duration)
    getEarthquakes(duration)
<<<<<<< HEAD
    length=@earthquakes_hash["features"].length
    @print_string = ""
    #------------------------------------------------------------test-------------------------------------------------------------------------------------------------------
    for i in 0...length
      @print_string = @print_string + @earthquakes_hash["features"][i]["properties"]["mag"].to_s + "\n"
    end
=======
    return @earthquakes_hash
    #length=@earthquakes_hash["features"].length
    #@print_string = ""
    ##------------------------------------------------------------test-------------------------------------------------------------------------------------------------------
    #for i in 0...length
    #  @print_string = @print_string + @earthquakes_hash["features"][i]["properties"]["mag"].to_s + "\n"
    #end
>>>>>>> baf625bd0d85a75bb01d9792d742610b79684b57
    #------------------------------------------------------------test-------------------------------------------------------------------------------------------------------
    #@json_object = NET::HTTP.get_response("earthquake.usgs.gov","/earthquakes/feed/v1.0/summary/all_week.geojson")
>>>>>>> refs/remotes/github/master
  end

end
