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
end
