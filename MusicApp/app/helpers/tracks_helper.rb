module TracksHelper

  def delete_track
    <<-HTML.html_safe
      <form action="#{track_url(@track)}" method="post">
        #{form_auth_token}
        <input type="hidden" name="_method" value="delete">
        <button>Delete Track</button>
      </form>
    HTML
  end
end
