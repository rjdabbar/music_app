module BandsHelper

  def delete_band
    <<-HTML.html_safe
      <form action="#{band_url(@band)}" method="post">
        #{form_auth_token}
        <input type="hidden" name="_method" value="delete">
        <button>Delete band</button>
      </form>
    HTML
  end

  def edit_band
    <<-HTML.html_safe
    <form class="" action="#{edit_band_url}" method="get">
      #{form_auth_token}
      <button>Edit band</button>
    </form>
    HTML
  end

  def add_new_album_to_band
    <<-HTML.html_safe
      <form action="#{new_band_album_url(@band)}" method="get">
        #{form_auth_token}
        <button>Add new album</button>
      </form>
    HTML
  end

  def add_new_band
    <<-HTML.html_safe
      <form action="#{new_band_url}" method="get">
        #{form_auth_token}
        <button>Add Band</button>
      </form>
    HTML
  end
end
