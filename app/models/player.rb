class Player < ActiveRecord::Base
  
  named_scope :last, lambda {|*args| { :limit => (args.first || 1), :order => "created_at desc" }}
  named_scope :position, lambda {|*args| { :conditions => ["pos_x = ? AND pos_y = ?", args[0], args[1]]}}
  
  def self.create_or_update(params={})
    player = Player.find_by_matricule(params[:matricule])
    if player  
      player.update_attributes(params)
    else
      Player.create(params)
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
