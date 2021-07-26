# frozen_string_literal: true

class NewslettersController < ApplicationController
  before_action :set_newsletter, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[index edit update destroy new create]

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
  end

  # GET /newsletters/1/edit
  def edit; end

  # POST /newsletters or /newsletters.json
  def create
    @newsletter = current_user.newsletters.build(newsletter_params)

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to root_path, notice: "#{@newsletter.name} has been created." }
        # format.json { render :show, status: :created, location: @newsletter }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsletters/1 or /newsletters/1.json
  def update
    respond_to do |format|
      if @newsletter.update(newsletter_params)
        format.html { redirect_to root_path, notice: "#{@newsletter.name} has been updated." }
        # format.json { render :show, status: :ok, location: @newsletter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters/1 or /newsletters/1.json
  def destroy
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "#{@newsletter.name} has been deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_newsletter
    @newsletter = Newsletter.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def newsletter_params
    params.require(:newsletter).permit(:name, :information, :statistics)
  end
end
