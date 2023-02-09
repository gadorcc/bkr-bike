class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = Bike.all
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to bikes_path
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
    redirect_to bikes_path, status: :see_other
  end

  private

  def bike_params
    params.require(:bike).permit(:title, :description, :type, :price, :status)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
