class LandscapesController < ApplicationController  
  layout "admin"
  
  def index
    @landscape = Landscape.first
  end
  
end
