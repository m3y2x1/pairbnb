class ReservationsController < ApplicationController
	before_action :set_reservation, only: [:show, :update, :destroy, :edit]
	before_action :require_login


	
	def new 
		@listing= Listing.find(params[:listing_id])
		@reservation=Reservation.new
	end

	def create 
	
		@listing= Listing.find(params[:listing_id])
		@reservation = current_user.reservations.new(reservation_params)
		
		@host = @listing.user.email

		if @reservation.save
		
		    # ReservationMailer.notification_email(current_user.email, @host, @reservation.listing.id, @reservation.id).deliver_later
		    # ReservationMailer to send a notification email after save
		    ReservationJob.perform_later(current_user.email, @host, @reservation.listing.id, @reservation.id)
    # call out reservation job to perform the mail sending task after @reservation is successfully saved
	
			redirect_to listing_reservation_path(@reservation.listing, @reservation)
		else 
		
			render 'new'
		end

	end

	def show

	end

	def edit
	end 

	def update
	
		@reservation.update(reservation_params)
		redirect_to listing_path(@listing.id)
	end

	def destroy
		@reservation.destroy
		redirect_to reservation_path
	end


	private
		def reservation_params
			params[:reservation][:start_date] = params[:reservation][:start_date].to_date('%d-%m-%y')
			params[:reservation][:end_date]=params[:reservation][:end_date].to_date('%d-%m-%y')
			params.require(:reservation).permit(:start_date, :end_date, :listing_id)
			
		end

		
		def set_reservation
			@reservation = Reservation.find(params[:id])
		end

	
		


end





