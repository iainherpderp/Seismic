class SeismicIndexController < ApplicationController
	
	def index
		if request.xhr?
			render :json => {:file_content => "AJAX DATA"}
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

end
