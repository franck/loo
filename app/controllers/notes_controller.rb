class NotesController < ApplicationController
  layout "admin"
  
  access_control do
    allow "user"
    allow "admin"
  end
  
  
  def index
    @player = Player.find(params[:player_id])
  end
  
  def create
    @player = Player.find(params[:note][:player_id])
    @note = Note.new(params[:note])
    @note.save
    respond_to do |format|
      format.html { redirect_to landscapes_url }
      format.js
    end
  end
  
end
