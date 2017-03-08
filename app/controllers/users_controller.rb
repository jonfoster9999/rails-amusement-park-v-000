class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
		end
	end

	def show
		if !logged_in?
			redirect_to "/"
		end
		@user = User.find(params[:id])
	end



	private

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
	end
end
