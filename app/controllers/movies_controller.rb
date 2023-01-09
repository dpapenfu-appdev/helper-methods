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
    movie_attributes = params.require(:movie).permit(:title, :description)
    @movie = Movie.new(movie_attributes)
    # the .new is capable of something called mass assignment. it, the .new method, is capable of receiving  a hash containing all the attribute value pairs, and it will assign them for us. 

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
    
    movie_attributes = params.require(:movie).permit(:title, :description)
    # @movie = Movie.new(movie_attributes)
    @movie = Movie.find(params.fetch(:id))
    @movie = Movie.update(movie_attributes)
    # @movie.title = params.fetch(:movie).fetch(:title)
    # @movie.description = params.fetch(:movie).fetch(:description)
   

    if @movie.valid?
      @movie.save
      redirect_to movie_url(@movie), notice: "Movie updated successfully." 
    else
      redirect_to movie_url(@movie), alert: "Movie failed to update successfully."
    end
  end

  def destroy
    
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully." 
  end
end
