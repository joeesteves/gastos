class SessionsController < ApplicationController
	skip_before_filter :current_user, :only => [:new, :create]	
	def new
	end

	def create
		user = User.find_by_nombre(params[:nombre])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Log"
		else
			flash.now.alert = "AH!! ESTAS FUERA SOQUETE"
			render "new"
		end
	end

	def logout

		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
end
