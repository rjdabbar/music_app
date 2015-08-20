class BandsController < ApplicationController
  before_action :ensure_user_signed_in

  def index
    @bands = Band.all
  end

  def show
    @band = Band.includes(:albums).find(params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      gather_band_errors
      render :new
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy!
    redirect_to bands_url
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      gather_band_errors
      render :edit
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

  def gather_band_errors
    flash.now[:errors] = @band.errors.full_messages
  end
end
