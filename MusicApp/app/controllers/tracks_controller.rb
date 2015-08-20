class TracksController < ApplicationController
  before_action :ensure_user_signed_in

  def new
    @track = Track.new(album_id: params[:album_id])
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      gather_track_errors
      render :new
    end
  end

  def show
    @track = Track.includes(:notes).find(params[:id])
    @note = Note.new
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy!
    redirect_to album_url(@track.album)
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      gather_track_errors
      render :edit
    end
  end

  private

  def track_params
      params.require(:track).permit(:album_id, :title, :style, :lyrics)
  end

  def gather_track_errors
    flash.now[:errors] = @track.errors.full_messages
  end
end
