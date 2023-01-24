# frozen_string_literal: true

class MovieReflex < ApplicationReflex
  delegate :uuid, to: :connection

  def submit
    @movie = Movie.new(movie_params)
    @movie.save
    morph '#stimulus_form',
          render(partial: 'movies/stimulus_form', locals: { movie: Movie.new })
  end

  private

  def movie_params
    params.require(:movie).permit(:title, actors_attributes: %i[id _destroy name])
  end
end
