class UsersController < ApplicationController
	
	before_filter :login_required, :only => :user_page
	
	def new
	  
		@user = User.new  
		
	end 

	def create  
		
		@user = User.new(params[:user])  
      
		if @user.save  
			redirect_to :user_page
		else  
			render "new"  
			
		end  
	end 
	
	def show
		@user = User.find(params[:id])
		
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	  def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
		format.html { redirect_to admin_url }
		format.json { head :no_content }
		end
		end
	
	
	def login
		user = User.authenticate(params[:username], params[:password])
		
		if session[:user_id] != nil
			
			redirect_to :user_page
		end
			
	end
	
	
	def process_login
		user = User.authenticate(params[:username], params[:password])  
  
		if user  
    
			session[:user_id] = user.id  
    
			redirect_to :user_page, :notice => "Logged in!"  
    
		else 
   
			render "log_in"  
   
		end  

	end  
  
	def user_page
     
		if session[:user_id] != nil
     
			@sessName = User.find(session[:user_id]).username
     
		else
      
			redirect_to 'log_in'
      
		end
  
	end
	
	def logout
		session[:user_id] = nil
		redirect_to '/'
	end
	
	def admin

		@sessName = User.find(session[:user_id]).username
		
		@users = User.all

		respond_to do |format|
		format.html
		format.json { render json: @users }
		end
	end
	  
end
