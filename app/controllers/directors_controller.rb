class DirectorsController < ApplicationController
  def index
    @q = Director.ransack(params[:q])
    @directors = @q.result(:distinct => true).includes(:movies).page(params[:page]).per(params[:per_page])
    @location_hash = Gmaps4rails.build_markers(@directors.where.not(:address_latitude => nil)) do |director, marker|
      marker.lat director.address_latitude
      marker.lng director.address_longitude
      marker.infowindow "<h5><a href='/directors/#{director.id}'>#{director.created_at}</a></h5><small>#{director.address_formatted_address}</small>"
    end

    render("directors/index.html.erb")
  end

  def show
    @movie = Movie.new
    @director = Director.find(params[:id])

    render("directors/show.html.erb")
  end

  def new
    @director = Director.new

    render("directors/new.html.erb")
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

    save_status = @director.save

    if save_status == true
      redirect_to(:back, :notice => "Director created successfully.")
    else
      render("directors/new.html.erb")
    end
  end

  def edit
    @director = Director.find(params[:id])

    render("directors/edit.html.erb")
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

    save_status = @director.save

    if save_status == true
      redirect_to(:back, :notice => "Director updated successfully.")
    else
      render("directors/edit.html.erb")
    end
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy

    redirect_to(:back, :notice => "Director deleted.")
  end
end
