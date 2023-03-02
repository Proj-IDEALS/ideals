class MapController < ApplicationController
  def index
    @newobjects = Newobject.all
  end
end
