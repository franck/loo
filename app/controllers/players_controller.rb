class PlayersController < ApplicationController  
  layout "admin"
  
  access_control :debug => true do
    allow "user"
    allow "admin"
  end
  
  def index
    @players = Player.all
  end
  
  def show
    @player = Player.find(params[:id])
    @notes = Note.find(:all, :conditions => ["player_id = ?", @player.id], :limit => 5, :order => "created_at desc")
  end
  
end