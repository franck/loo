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
    @notes = Note.paginate(:page => params[:page], :per_page => 10, :conditions => ["player_id = ?", @player.id], :order => "created_at desc")
  end
  
end