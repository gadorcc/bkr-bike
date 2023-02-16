class BookingsController < ApplicationController
  before_action :set_bike, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(start_date: "2023-02-17", end_date: "2023-02-16")
    @booking.bike = @bike
    @booking.user = current_user
    if @booking.save!
      redirect_to bike_path(@bike), alert: "You successfully booked a bike!"
    else
      render :new
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
