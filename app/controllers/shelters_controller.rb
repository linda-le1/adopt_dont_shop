class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end 
end
