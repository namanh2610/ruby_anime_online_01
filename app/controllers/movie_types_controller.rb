class MovieTypesController < ApplicationController
  def show
    if @movie_type = MovieType.select_movie_type
      .find_by(id: params[:id])
      @movie = MovieType.find_by(id: params[:id]).movie.select_movie.where_movie_status
        .page(params[:page]).per Settings.movie_type.value_item_movie
    else
      flash.now[:error] = t "movie_type.error"
      redirect_to root_path
    end
  end
end
