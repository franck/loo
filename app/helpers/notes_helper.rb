module NotesHelper
  
  def display_note(note)
    html = "<li id='note-#{note.id}'>"
    html << note.content
    html << "<div class='note-info'>"
    html << "<span class='player-name'>#{note.user.player_name}</span>, #{l(note.updated_at, :format => :default)}"
    html << "&nbsp;" + link_to("suppr", note_url(note), :class => "note-suppr")
    html << "</div></li>"
  end
end