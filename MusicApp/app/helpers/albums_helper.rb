module AlbumsHelper

  def delete_album
    <<-HTML.html_safe
      <form action="#{album_url(@album)}" method="post">
        #{form_auth_token}
        <input type="hidden" name="_method" value="delete">
        <button>Delete Album</button>
      </form>
    HTML
  end

  def edit_album
    <<-HTML.html_safe
      <form action="#{edit_album_url(@album)}" method="get">
        #{form_auth_token}
        <button>Edit Album</button>
      </form>
    HTML
  end

  def add_new_track_to_album
    <<-HTML.html_safe
      <form action="#{new_album_track_url(@album)}" method="get">
        #{form_auth_token}
        <button>Add new track to album</button>
      </form>
    HTML
  end
end
