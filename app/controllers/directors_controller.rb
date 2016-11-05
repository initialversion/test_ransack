class DirectorsController < ApplicationController
  def index
    @directors = Director.page(params[:page])
    @location_hash = Gmaps4rails.build_markers(@directors.where.not(:address_latitude => nil)) do |director, marker|
      marker.lat director.address_latitude
      marker.lng director.address_longitude
      marker.infowindow "<h5><a href='/directors/#{director.id}'>#{director.created_at}</a></h5><small>#{director.address_formatted_address}</small>"
    end
  end

  def show
    @movie = Movie.new
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new
    @director.name = params[:name]
    @director.dob = params[:dob]
    @director.age = params[:age]
    @director.bio = params[:bio]
    @director.oscar = params[:oscar]
    @director.image = params[:image]
    @director.address = params[:address]

    if @director.save
      redirect_to "/directors", :notice => "Director created successfully."
    else
      render 'new'
    end
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    @director.name = params[:name]
    @director.dob = params[:dob]
    @director.age = params[:age]
    @director.bio = params[:bio]
    @director.oscar = params[:oscar]
    @director.image = params[:image]
    @director.address = params[:address]

    if @director.save
      redirect_to "/directors", :notice => "Director updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy

    redirect_to "/directors", :notice => "Director deleted."
  end
end
