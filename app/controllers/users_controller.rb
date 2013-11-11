class UsersController < ApplicationController
	
	before_filter :login_required, :only => :user_page
	
	def new
	  
		@user = User.new  
		
	end 

	def create  
		
		@user = User.new(params[:user])  
      
		if @user.save  
			redirect_to :sign_up, :notice => "Signed up!"  
		else  
			render "new"  
			
		end  
	end 
	
	def login
		
	end
	
	def process_login
		user = User.authenticate(params[:username], params[:password])  
  
		if user  
    
			session[:user_id] = user.id  
    
			redirect_to :user_page, :notice => "Logged in!"  
    
		else  
   
			flash.now.alert = "Invalid username, email or password"  
   
			render "login"  
   
		end  

	end  
  
	def user_page
     
		if session[:user_id] != nil
     
			@sessName = User.find(session[:user_id]).username
     
		else
      
			@sessName = "Guest"
      
		end
  
	end
	
	def logout
		session[:user_id] = nil
		redirect_to '/' => "Logged out!"
	end
	  
end
