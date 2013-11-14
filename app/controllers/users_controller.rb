#By Iain Macdonald

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

    @session_user = User.find(session[:user_id])
	end

	def edit
		@user = User.find(params[:id])
        @current_admin = User.find(session[:user_id])
	end

	  def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
		format.html { redirect_to admin_url }
		format.json { head :no_content }
		end
	end

	def update
		@users = User.find(params[:id])
		if @users.update_attributes(params[:isadmin])
			redirect_to :isadmin => 'admin'
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

			render "login"

		end

	end

	def user_page

		if session[:user_id] != nil

			@user = User.find(session[:user_id])

		else

			redirect_to 'log_in'

		end

	end

	def logout
		session[:user_id] = nil
		redirect_to '/'
	end

	def admin
		@session_user = User.find(session[:user_id])
    unless @session_user.isadmin?
      redirect_to '/'
    end

    @users = User.all
  end

  def setadmin
    @session_user = User.find(session[:user_id])
    unless @session_user.isadmin?
      redirect_to '/'
    end

    @user = User.find(params[:id])
    @user.update_column(:isadmin, params['user']['isadmin'])

    redirect_to '/admin'
  end
end
