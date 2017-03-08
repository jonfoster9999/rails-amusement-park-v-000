class SessionsController < ApplicationController
	
	def signin
		@user = User.new
	end

	def create
		@user = User.find_by(:name => params[:user][:name])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to @user
		else

		end
	end

	def logout
		session.clear
		redirect_to root_path
	end
end