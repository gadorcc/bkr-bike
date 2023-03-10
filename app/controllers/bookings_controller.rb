class BookingsController < ApplicationController
  before_action :set_bike, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bike = @bike
    @booking.user = current_user
    if @booking.save!
      redirect_to bike_path(@bike), alert: "You successfully booked a bike!"
    else
      render :new
    end
  end

  def checkout
    @bookings = current_user.bookings
    @titles = @bookings.includes(:user).map { |booking| Bike.find(booking.bike_id).title }
  end

  def index
    @bookings = Booking.all
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
