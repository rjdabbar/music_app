class AlbumsController < ApplicationController

  def show
    @album = Album.includes(:tracks, :band).find(params[:id])
  end

  def new
    @bands = Band.all
    @band = Band.find(params[:band_id])

  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def album_params
    params.require(:album).permit(:name, :style, :band_id)
  end

  def current_band

  end
end
