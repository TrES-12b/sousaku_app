class HomeController < ApplicationController
  def index
    @worlds = World.all
  end
end
