# frozen_string_literal: true

class SlotTypesController < ApplicationController
  before_action :set_slot_type, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[show update edit destroy create new]
  before_action :set_associated_newsletter

  # GET /slot_types or /slot_types.json
  def index
    @slot_types = SlotType.all
  end

  # GET /slot_types/1 or /slot_types/1.json
  def show; end

  # GET /slot_types/new
  def new
    @slot_type = SlotType.new
  end

  # GET /slot_types/1/edit
  def edit; end

  # POST /slot_types or /slot_types.json
  def create
    @slot_type = @newsletter.slot_types.build(slot_type_params)

    respond_to do |format|
      if @slot_type.save
        format.html { redirect_to :back, notice: "#{@slot_type.name} has been created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slot_types/1 or /slot_types/1.json
  def update
    respond_to do |format|
      if @slot_type.update(slot_type_params)
        format.html { redirect_to @slot_type, notice: 'Slot type was successfully updated.' }
        format.json { render :show, status: :ok, location: @slot_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @slot_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slot_types/1 or /slot_types/1.json
  def destroy
    @slot_type.destroy
    respond_to do |format|
      format.html { redirect_to slot_types_url, notice: 'Slot type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_slot_type
    @slot_type = SlotType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def slot_type_params
    params.require(:slot_type).permit(:name, :description)
  end

  def set_associated_newsletter
    @newsletter = current_user.newsletters.first
  end
end
