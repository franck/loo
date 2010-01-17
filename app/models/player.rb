class Player < ActiveRecord::Base
  
  def self.create_or_update(mat,x,y,race)
    player = Player.find_by_matricule(mat)
    if player  
      player.update_attributes(:pos_x => x, :pos_y => y)
    else
      Player.create(:matricule => mat, :pos_x => x, :pos_y => y, :race => Player.get_race(race), :html_class => race)
    end
  end
  
  def self.get_race(race)
    case race
    when "o"
      "olympien"
    when "n"
      "nain"
    end
  end
  
end
