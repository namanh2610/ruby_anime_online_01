class MoviesController < ApplicationController
  def show
    @movie = Movie.detail_properties
      .check_status_movie.find_by(id: params[:id])

    if @movie
      @episodes = Episode.episode_properties.find_by movie_id: params[:id]
    else
      flash.now[:error] = t "movie_detail.error"
      redirect_to root_path
    end
  end
end
