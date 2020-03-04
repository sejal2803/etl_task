class HomeController < ApplicationController
  def index
    @units = Unit.all
  end
end
