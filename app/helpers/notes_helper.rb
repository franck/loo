module NotesHelper
  
  def display_note(note, short=nil)
    html = "<li id='note-#{note.id}'>"
    if short
      html << truncate(note.content, 200)
    else
      html << note.content
    end
    html << "<div class='note-info'>"
    html << "<span class='player-name'>#{note.user.player_name}</span>, #{l(note.updated_at, :format => :default)}"
    html << "&nbsp;" + link_to("suppr", note_url(note), :class => "note-suppr")
    html << "</div></li>"
  end
end
