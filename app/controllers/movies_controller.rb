class MoviesController < ApplicationController
  def show
    @movie = Movie.detail_properties
      .check_status_movie.find_by(id: params[:id])

    return if @movie
    flash.now[:error] = t "movie_detail.error"
    redirect_to root_path
  end
end
