class LandscapesController < ApplicationController  
  layout "admin"
  
  access_control :debug => true do
    allow "user"
    allow "admin"
  end
  
  def index
    @landscape = Landscape.first
    @note = current_user.notes.build
    user = User.find(params[:user]) if params[:user]
    if user
      @user = user
    else
      @user = current_user
    end
  end
  
end
