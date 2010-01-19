class Player < ActiveRecord::Base
  has_many :notes
  
  named_scope :last, lambda {|*args| { :limit => (args.first || 1), :order => "created_at desc" }}
  named_scope :position, lambda {|*args| { :conditions => ["pos_x = ? AND pos_y = ?", args[0], args[1]]}}
  
  def self.create_or_update(params={})
    player = Player.find_by_matricule(params[:matricule])
    if player
      logger.debug "UPDATE PLAYER : #{params.inspect}"
      player.update_attributes(params)
    else
      logger.debug "CREATE PLAYER : #{params.inspect}"
      Player.create(params)
    end
  end
  
  def self.get_race(race)
    result = case race
    when "o"
      "olympien"
    when "n"
      "nain"
    when "s"
      "homme sauvage"
    end
    logger.debug "RACE : #{race} / #{result}"
    return result
  end
  
end
