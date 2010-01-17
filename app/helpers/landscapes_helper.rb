module LandscapesHelper
  
  def display_map(landscape, user)
    return if user.sight.blank?
    html = ""
    html << "<div id='sight'>"
    html << "<table id='s4' cellpadding='0' cellspacing='0' style='border-color:#ff9933;'>"
  
    size = 11
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
        player = Player.find(:first, :conditions => ["pos_x = ? AND pos_y = ?", origin_x+j, origin_y-i])
        field = Field.find(:first, :conditions => ["pos_x = ? AND pos_y = ?", origin_x+j, origin_y-i])
        if player
          html << "<td class='#{player.html_class}'>#{player.matricule}</td>" 
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
end
