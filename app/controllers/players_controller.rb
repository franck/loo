class PlayersController < ApplicationController  
  layout "admin"
  
  access_control :debug => true do
    allow "user"
    allow "admin"
  end
  
  def index
    @players = Player.all
  end
  
end