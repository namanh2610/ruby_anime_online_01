class MoviesController < ApplicationController
  def show
    return if @movie = Movie.select_detail.where_movie_status.find_by(id: params[:id])
    flash.now[:error] = t "movie_detail.error"
    redirect_to root_path
  end
end
