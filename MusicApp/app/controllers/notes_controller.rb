class NotesController < ApplicationController
  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to track_url(@note.track)
    else
      gather_note_errors
      redirect_to track_url(@note.track)
    end
  end

  def destroy
    @note = Note.find(params[:note][:id])
    if current_user != @note.user
      render status: :forbidden, text: "YOU ARE FORBIDDEN"
    else
      @note.destroy!
      redirect_to track_url(@note.track)
    end
  end


  private

  def note_params
    params.require(:note).permit(:text, :track_id)
  end

  def gather_note_errors
    flash.now[:errors] = @note.errors.full_messages
  end
end
