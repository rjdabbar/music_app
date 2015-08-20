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
end
