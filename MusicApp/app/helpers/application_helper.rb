module ApplicationHelper

  def form_auth_token
    <<-HTML.html_safe
    <input
          type="hidden"
          name="authenticity_token"
          value="<%= form_authenticity_token %>">
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
end
