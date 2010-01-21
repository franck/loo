module LandscapesHelper
  
  def display_map(landscape, user, size=11)
    return if (user.sight.blank? || user.player.pos_x.nil? || user.player.pos_y.nil?)
    html = ""
    html << "<div id='sight'>"
    html << "<table id='s4' cellpadding='0' cellspacing='0' style='border-color:#ff9933;'>"
    
    origin_x, origin_y = user.player.pos_x-size, user.player.pos_y+size
  
    html << "<tr>"
    html << "<td></td>"
    for i in (0..size*2)
      html << "<td>#{origin_x+i}</td>"
    end
    html << "</tr>"
  
    for i in (0..size*2)
      html << "<tr>"
      html << "<td>#{origin_y-i}</td>"
      for j in (0..size*2)
        player = Player.position(origin_x+j, origin_y-i).last
        #player = Player.find(:first, :conditions => ["pos_x = ? AND pos_y = ?", origin_x+j, origin_y-i])
        field = Field.find(:first, :conditions => ["pos_x = ? AND pos_y = ?", origin_x+j, origin_y-i])
        if player
          html << "<td class='player #{player.html_class}'>"
          html << player.matricule.to_s
          html << add_info(player)
          html << "</td>" 
        elsif field
          html << "<td class='#{field.html_class}'></td>"
        else
          html << "<td class='unknown'>?</td>" 
        end
      end
      html << "</tr>"
    end
  
    html << "</table>"
    html << "</div>"    
  end
  
  def add_info(player)
    html = ""
    html << "<div class='info' id='info-#{player.matricule}'>"
    html << "<a class='close' href='#'>[ X ]</a>"
    html << "<p><strong>#{link_to(player.name, player_url(player))} (#{player.matricule})</strong></p>"
    html << "<p>Mis à jour : #{l(player.updated_at, :formats => :default)}</p>"
    html << render( :partial => "notes/new", :locals => { :player_id => player.id })
    html << "<ul class='notes'>"
    notes = Note.find(:all, :conditions => ["player_id = ?", player.id], :limit => 5, :order => "created_at desc")
    logger.debug "NOTES : #{notes.inspect}"
    for note in notes
      html << display_note(note, true)
    end
    html << "</ul>"
    html << "</div>"
    return html
  end
end
