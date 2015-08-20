module ApplicationHelper

  def form_auth_token
    <<-HTML.html_safe
    <input
          type="hidden"
          name="authenticity_token"
          value="#{form_authenticity_token} %>">
    HTML
  end

  def flash_errors
    if flash.now[:errors]
      flash.now[:errors].map do |error|
        <<-HTML.html_safe
          #{error} <br>
        HTML
      end.join
    end
  end

  def sign_out_button
    <<-HTML.html_safe
      <form action="#{session_url}"method="post">
        #{form_auth_token}
        <input type="hidden" name="_method" value="delete">
        <button>Sign Out</button>
      </form>
    HTML
  end
end
