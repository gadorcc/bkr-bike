class ReviewsController < ApplicationController
  def create
    @bike = Bike.find(params[:bike_id])
    @review = Review.new(review_params)
    @review.bike = @bike
    if @review.save
      redirect_to bike_path(@bike)
    else
      render "bikes/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
