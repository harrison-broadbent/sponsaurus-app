# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :authenticate_user!, only: %i[update edit destroy]
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_associated_slot

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show; end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings or /bookings.json
  def create
    @booking = @slot.build_booking(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to [@slot, @booking], notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to [@slot, @booking], notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @newsletter = @booking.slot.newsletter
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to [@newsletter, @slot], notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_associated_slot
    @slot = Slot.find(params[:slot_id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    booker_params = [:booker_name, :booker_email, :booker_billing_address]
    ad_params = [:advert_title, :advert_product, :advert_url, :advert_image_url, :advert_description]
    params.require(:booking).permit([booker_params, ad_params].flatten)
  end
end
