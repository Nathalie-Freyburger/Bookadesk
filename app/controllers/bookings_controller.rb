class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @office = Office.find(@booking.office_id)
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    office = Office.find(params[:office_id])
    @booking = Booking.new(booking_params)
    authorize @booking

    @booking.user = current_user
    @booking.office = office
    @booking.total_price = office.price
    @booking.save

        flash[:notice] = "You have a new booking!"
        redirect_to user_path(current_user)
    end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to request.referrer
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
