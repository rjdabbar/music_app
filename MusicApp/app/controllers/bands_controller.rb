class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def show
    @band = Band.includes(:albums).find(params[:id])
  end

  def new

  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def destroy
    @band = Band.find(params[:id])
    Band.delete(@band)
    redirect_to bands_url
  end

  def edit

  end

  def update

  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
