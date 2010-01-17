class PlayersController < ApplicationController  
  layout "admin"
  
  def index
    @players = Player.all
  end
  
end