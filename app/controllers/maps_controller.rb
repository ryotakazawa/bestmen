class MapsController < ApplicationController
  def index
    @pics = Pic.all
    @pic = Pic.first
    
    @array_pics = []
    @pics.each do |pic|
      @array_pics << pic
    end

    respond_to do |format|
      format.html
      format.json { render json: @array_pics }
    end
  end
end
