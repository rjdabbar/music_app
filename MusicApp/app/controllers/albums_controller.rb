class AlbumsController < ApplicationController
  before_action :ensure_user_signed_in, :ensure_user_is_activated
  def show
    @album = Album.includes(:tracks, :band).find(params[:id])
  end

  def new
    @album = Album.new(band_id: params[:band_id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      gather_album_errors
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      gather_album_errors
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy!
    redirect_to band_url(@album.band)
  end

  private

  def album_params
    params.require(:album).permit(:name, :style, :band_id)
  end

  def gather_album_errors
    flash.now[:errors] = @album.errors.full_messages
  end
end
