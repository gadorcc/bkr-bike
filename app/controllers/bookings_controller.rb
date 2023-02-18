class BookingsController < ApplicationController
  before_action :set_bike, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = @bike

    if @booking.save
      flash[:alert] = 'Booking confirmed'
      redirect_to bike_path(@bike)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end
end
