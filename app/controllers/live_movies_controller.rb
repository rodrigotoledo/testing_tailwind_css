class LiveMoviesController < ApplicationController
  before_action :set_live_movie, only: %i[ show edit update destroy ]

  # GET /live_movies or /live_movies.json
  def index
    @live_movies = LiveMovie.all
  end

  # GET /live_movies/1 or /live_movies/1.json
  def show
  end

  # GET /live_movies/new
  def new
    @live_movie = LiveMovie.new
  end

  # GET /live_movies/1/edit
  def edit
  end

  # POST /live_movies or /live_movies.json
  def create
    @live_movie = LiveMovie.new(live_movie_params)

    respond_to do |format|
      if @live_movie.save
        format.html { redirect_to live_movie_url(@live_movie), notice: "Live movie was successfully created." }
        format.json { render :show, status: :created, location: @live_movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @live_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /live_movies/1 or /live_movies/1.json
  def update
    respond_to do |format|
      if @live_movie.update(live_movie_params)
        format.html { redirect_to live_movie_url(@live_movie), notice: "Live movie was successfully updated." }
        format.json { render :show, status: :ok, location: @live_movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @live_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /live_movies/1 or /live_movies/1.json
  def destroy
    @live_movie.destroy

    respond_to do |format|
      format.html { redirect_to live_movies_url, notice: "Live movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_live_movie
      @live_movie = LiveMovie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def live_movie_params
      params.require(:live_movie).permit(:title, :artist_id, :short_description, :year)
    end
end
