class MovieSearchsController < ApplicationController
  def index
    @movie = Movie.movie_properties
      .search_movie_by_name(params[:search]).check_status_movie
      .page(params[:page]).per(Settings.movie_type.value_item_movie)

    return if @movie
    flash.now[:error] = t "movie_type.error"
    redirect_to root_path
  end
end

