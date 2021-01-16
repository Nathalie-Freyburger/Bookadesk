class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
