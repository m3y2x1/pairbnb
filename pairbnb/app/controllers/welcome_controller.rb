class WelcomeController < ApplicationController
  def index
  	  @listings = Listing.all
  end

def index
		@listings = Listing.all
	end
	
	def new 
		@listing=Listing.new
	end

	def create 
		byebug
		@listing = current_user.listings.new(listing_params)

		if @listing.save
			redirect_to listing_path(@listing.id)
		else 
			render 'new'
		end

	end

	def show

	end

	def edit
	end 

	def update
		byebug
		@listing.update(listing_params)
		redirect_to listing_path(@listing.id)
	end

	def destroy
		@listing.destroy
		redirect_to listings_path
	end

	private
		def listing_params
			params.require(:listing).permit(:listing_name, :room_type, :description, :no_bedroom, :no_bathroom, :no_bed, :max_people, :cost_per_night, :address, :city, :state, :country, :user_id, {images: []})
		end

		
		def set_listing
			@listing = Listing.find(params[:id])
		end


end