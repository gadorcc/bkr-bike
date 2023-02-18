class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @bikes = Bike.where(bike_type: params[:query])
    else
      @bikes = Bike.all
    end
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        marker_window_html: render_to_string(partial: "marker_window", locals: {bike: bike}),
        marker_icon_html: render_to_string(partial: "marker_icon", locals: {bike: bike})
      }
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike), notice: 'Bike post was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to bike_path(@bike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bike.destroy
    redirect_to bikes_path, notice: 'Bike was successfully destroyed.'
    # redirect_to bikes_path, status: :see_other if @bike.destroy
  end

  private

  def bike_params
    params.require(:bike).permit(:title, :description, :bike_type, :price, :status, :photo, :query, :bike_postcode2)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
