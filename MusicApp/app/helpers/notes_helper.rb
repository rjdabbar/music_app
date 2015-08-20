module NotesHelper

  def delete_note(note)
    <<-HTML.html_safe
      <form action="#{note_url(note)}" method="post">
        #{form_auth_token}
        <input type="hidden" name="_method" value="delete">
        <button>Remove Note</button>
      </form>
    HTML
  end
end
