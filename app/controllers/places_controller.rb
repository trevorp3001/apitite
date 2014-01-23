class PlacesController < ApplicationController

	before_action :find_place, only: [:show, :edit, :update, :destroy]



	def index
		#@places = Place.near("London")

		#if the user has searched a location search near the param they typed in
		#else show all the places near london
		#the params they've seached for is params[:location]

		if params[:location].present?
			#search fo the places near params[:location]
			@places = Place.near(params[:location])
		else
			#else search for places near London
			@places = Place.near("London")	
		end
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.new(place_params)

		if @place.save

			#go back to homepage
			redirect_to root_path

		else
			render "new"



		end
	end

	def destroy
		#@place = Place.find(params[:id])

		@place.destroy

		redirect_to root_path


	end

		#shortcut for getting form data
	def place_params
		params.require(:place).permit(:name, :address, :latitude, :longitute)
	end

	def find_place
		@place = Place.find(params[:id])
	end

end
