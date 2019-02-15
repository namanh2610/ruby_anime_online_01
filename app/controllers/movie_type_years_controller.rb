class MovieTypeYearsController < ApplicationController
  def show
    if params[:id] == Settings.movie_type.value_year
      boolean_movie ">="
    else
      boolean_movie "="
    end
  end

  private

  def boolean_movie compare
    @movie = Movie.movie_properties
      .get_movie_by_year(params[:id],compare).check_status_movie
      .page(params[:page]).per(Settings.movie_type.value_item_movie)

    return if @movie
    flash.now[:error] = t "movie_type.error"
    redirect_to root_path
  end
end
