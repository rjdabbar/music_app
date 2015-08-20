class TracksController < ApplicationController

  def new
    @album = Album.find(params[:album_id])
    @albums = Album.all
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy!
    redirect_to album_url(@track.album)
  end

  def edit

  end

  def update

  end

  private

  def track_params
      params.require(:track).permit(:album_id, :title, :style)
  end

end
