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
        "#{error} <br>".html_safe
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

  def sign_in_button
    <<-HTML.html_safe
      <form action="#{new_session_url}" method="get">
        #{form_auth_token}
        <button>Sign in!</button>
      </form>
    HTML
  end

  def sign_up_button
    <<-HTML.html_safe
      <form action="#{new_user_url}" method="get">
        #{form_auth_token}
        <button>Sign up!</button>
      </form>
    HTML
  end
end
