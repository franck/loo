module NotesHelper
  
  def display_note(note)
    html = "<li>"
    html << note.content
    html << "<div class='note-info'>"
    html << "<span class='player-name'>#{note.user.player_name}</span>, #{l(note.updated_at, :format => :default)}"
    html << "</div></li>"
  end
end
