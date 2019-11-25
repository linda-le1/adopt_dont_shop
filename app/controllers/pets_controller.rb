class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def list_by_shelter
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create!(pet_params)
    redirect_to "/shelters/#{shelter.id}"
  end


  private
    def pet_params
      params.permit(:image, :name, :approximate_age, :description, :sex)
    end

end
