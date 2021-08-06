# frozen_string_literal: true

class SlotsController < ApplicationController
  before_action :set_slot, only: %i[show edit update destroy toggle_booking_status]
  before_action :authenticate_user!, only: %i[show update edit destroy create new]
  before_action :set_associated_newsletter

  layout 'blank', only: :embed

  # Lets the slot owner toggle a slot between booked and open.
  # Reloads the page on each redirect.
  def toggle_booking_status
    slot = Slot.find(params[:id])
    slot.update(booked: !slot.booked)
    redirect_to pretty_newsletter_slots_path(@newsletter), notice: 'Slot was successfully updated.'
  end

  # GET /slots or /slots.json
  # Owner can see all their slots, viewers can only see slots in the future
  def index
    collect_slots
  end

  # GET /slots/embed
  # Route for embeddable widget
  def embed
    response.headers.delete 'X-Frame-Options'
    collect_slots
  end

  # GET /slots/new
  def new
    @slot = Slot.new
    @slot_type_options =
      @newsletter.slot_types.try(:map) { |type| [type.name, type.id] }
                 .append(['+ Add another type', 'new'])
  end


  # POST /slots or /slots.json
  def create
    @slot_type_options =
      @newsletter.slot_types.try(:map) { |type| [type.name, type.id] }
                 .append(['+ Add another type', 'new'])

    @slot = @newsletter.slots.build(slot_params)

    respond_to do |format|
      if @slot.save
        format.html { redirect_to pretty_newsletter_slots_path(@newsletter), notice: 'Slot was successfully created.' }
        format.json { render :show, status: :created, location: @slot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slots/1 or /slots/1.json
  def destroy
    @slot.destroy
    respond_to do |format|
      format.html { redirect_to pretty_newsletter_slots_path(@newsletter), notice: 'Slot was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # sets the active slot
  def set_slot
    @slot = Slot.find(params[:id])
  end

  # sets the newsletter associated with the slot
  def set_associated_newsletter
    @newsletter = if params[:newsletter_id]
                    Newsletter.friendly.find(params[:newsletter_id])
                  else
                    @slot.newsletter
                  end
  end

  def collect_slots
    @slots = @newsletter.slots
    @future_slots = Array(@newsletter.slots.reject(&:expired?).reverse)
    @past_slots = Array((@newsletter.slots.select(&:expired?) if helpers.current_user_owns_newsletter? @newsletter))
  end

  # Only allow a list of trusted parameters through.
  def slot_params
    params.require(:slot).permit(:price, :publish_date, :slot_type_id)
  end
end
