class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @bikes = Bike.where(bike_type: params[:query])
    else
      @bikes = Bike.all
    end
  end

  def show
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
    @bike = Bike.find
    @bike.destroy
    redirect_to bikes_path, status: :see_other
  end

  private

  def bike_params
    params.require(:bike).permit(:title, :description, :bike_type, :price, :status, :photo, :query)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
