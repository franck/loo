class LandscapesController < ApplicationController  
  layout "admin"
  
  access_control :debug => true do
    allow "user"
    allow "admin"
  end
  
  def index
    @landscape = Landscape.first
  end
  
end
