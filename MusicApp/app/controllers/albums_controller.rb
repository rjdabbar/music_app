class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
  end

  def new
    @bands = Band.all
    @band = Band.find(params[:band_id])

  end

  def create
    fail
    @album = Album.new()
  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def album_params
    params.require(:album).permit(:name, :style)
  end

  def current_band

  end
end
