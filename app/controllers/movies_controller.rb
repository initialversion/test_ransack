class MoviesController < ApplicationController
  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(:distinct => true).includes(:director).page(params[:page]).per(params[:per_page])

    render("movies/index.html.erb")
  end

  def show
    @movie = Movie.find(params[:id])

    render("movies/show.html.erb")
  end

  def new
    @movie = Movie.new

    render("movies/new.html.erb")
  end

  def create
    @movie = Movie.new

    @movie.title = params[:title]
    @movie.duration = params[:duration]
    @movie.rating = params[:rating]
    @movie.description = params[:description]
    @movie.director_id = params[:director_id]

    save_status = @movie.save

    if save_status == true
      redirect_to(:back, :notice => "Movie created successfully.")
    else
      render("movies/new.html.erb")
    end
  end

  def edit
    @movie = Movie.find(params[:id])

    render("movies/edit.html.erb")
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.title = params[:title]
    @movie.duration = params[:duration]
    @movie.rating = params[:rating]
    @movie.description = params[:description]
    @movie.director_id = params[:director_id]

    save_status = @movie.save

    if save_status == true
      redirect_to(:back, :notice => "Movie updated successfully.")
    else
      render("movies/edit.html.erb")
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    redirect_to(:back, :notice => "Movie deleted.")
  end
end
