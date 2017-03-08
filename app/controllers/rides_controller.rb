class RidesController < ApplicationController
	def create
		@ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
		if @ride.take_ride == true
			flash[:notice] = "Thanks for riding the Ferris Wheel!"
			redirect_to User.find(params[:user_id])
		else
			flash[:notice] = @ride.take_ride
			redirect_to User.find(params[:user_id])
		end
	end


end