class MoviesController < ApplicationController
  def new
    @movie = Movie.new

   end

  def index
    

    @movies = Movie.order( created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @list_of_movies
      end

      format.html
        
      end
  end
  

  def show
    # @the_movie  = Movie.where( params.fetch(:id)).first

    # @the_movie  = Movie.find_by( params.fetch(:id))... find works only if you are searching by the default... which is id... otherwise use find_by
    @movie = Movie.find(params.fetch(:id))

    
  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch(:movie).fetch(:title)
    @movie.description = params.fetch(:movie).fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully." 
    else
      render "new"
    end
  end

  def edit
  @movie = Movie.find(params.fetch(:id))

    
  end

  def update
    
    @movie = Movie.find(params.fetch(:id))

    @movie.title = params.fetch(:title)
    @movie.description = params.fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movie_url(the_movie), notice: "Movie updated successfully." 
    else
      redirect_to movie_url(the_movie), alert: "Movie failed to update successfully."
    end
  end

  def destroy
    
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully." 
  end
end
