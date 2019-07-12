class MapsController < ApplicationController
  def index
    @pics = Pic.all
    @hash = Gmaps4rails.build_markers(@pics) do |pic, marker|
      marker.lat pic.latitude
      marker.lng pic.longitude
      marker.infowindow pic.title
    end
  end
end
