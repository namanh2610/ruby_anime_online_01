class MovieTypesController < ApplicationController
  def show
    @movie_type = MovieType.movie_type
      .find_by(id: params[:id])

    if @movie_type
      @movie = MovieType.find_by(id: params[:id]).movie
        .movie_properties.check_status_movie
        .page(params[:page]).per Settings.movie_type.value_item_movie
    else
      flash.now[:error] = t "movie_type.error"
      redirect_to root_path
    end
  end
end
