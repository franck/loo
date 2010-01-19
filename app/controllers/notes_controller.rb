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
    @note = Note.new(params[:note])
    if @note.save
      flash[:notice] = "Note ajoutée"
    end
    redirect_to landscapes_url
  end
  
end
