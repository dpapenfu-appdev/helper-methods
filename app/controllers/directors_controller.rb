class DirectorsController < ApplicationController
  def new
    @director = Director.new

   end

  def index
    

    @directors = Director.order( created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @directors
      end

      format.html
        
      end
  end
  

  def show
    # @the_movie  = Movie.where( params.fetch(:id)).first

    # @the_movie  = Movie.find_by( params.fetch(:id))... find works only if you are searching by the default... which is id... otherwise use find_by
    @director = Director.find(params.fetch(:id))

    
  end

  def create
    director_attributes = params.require(:director).permit(:name, :bio, :dob)
    @director = Director.new(director_attributes)
    # the .new is capable of something called mass assignment. it, the .new method, is capable of receiving  a hash containing all the attribute value pairs, and it will assign them for us. 

    if @director.valid?
      @director.save
      redirect_to directors_url, notice: "Director created successfully." 
    else
      render "new"
    end
  end

  def edit
  @director = Director.find(params.fetch(:id))

    
  end

  def update
    
    # movie_attributes = params.require(:movie).permit(:title, :description)
    # @movie = Movie.new(movie_attributes)
    # @movie = Movie.find(params.fetch(:id))
    # @movie = Movie.update(movie_attributes)
    # @movie.title = params.fetch(:movie).fetch(:title)
    # @movie.description = params.fetch(:movie).fetch(:description)
    
       director_attributes = params.require(:director).permit(:director, :name, :dob, :id)
       @director = Director.find(params.fetch(:id))
      
      if @director
       @director.update(director_attributes)
         redirect_to director_url(@director), notice: "Director updated successfully."
        else
       redirect_to director_url(@director), alert: "Director failed to update successfully."
        end
       end

  #   if @movie.valid?
  #     @movie.save
  #     redirect_to movie_url(@movie), notice: "Movie updated successfully." 
  #   else
  #     redirect_to movie_url(@movie), alert: "Movie failed to update successfully."
  #   end
  # end

  def destroy
    
    @director = Director.find(params.fetch(:id))

    @director.destroy

    redirect_to directors_url, notice: "Director deleted successfully." 
  end
end
