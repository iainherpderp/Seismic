class ApplicationController < ActionController::Base
  protect_from_forgery
<<<<<<< HEAD
  
	def login_required
		return true if User.find_by_id(session[:user_id])
		access_denied
		return false
	end
	
	def access_denied
		flash[:error] = 'Please login to Seismic to view this page!'
		redirect_to :log_in
    end
  end
=======
end
>>>>>>> baf625bd0d85a75bb01d9792d742610b79684b57
