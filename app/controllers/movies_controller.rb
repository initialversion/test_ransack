class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new
    @movie.title = params[:title]
    @movie.duration = params[:duration]
    @movie.rating = params[:rating]
    @movie.description = params[:description]
    @movie.director_id = params[:director_id]

    if @movie.save
      redirect_to "/movies", :notice => "Movie created successfully."
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.title = params[:title]
    @movie.duration = params[:duration]
    @movie.rating = params[:rating]
    @movie.description = params[:description]
    @movie.director_id = params[:director_id]

    if @movie.save
      redirect_to "/movies", :notice => "Movie updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    redirect_to "/movies", :notice => "Movie deleted."
  end
end
