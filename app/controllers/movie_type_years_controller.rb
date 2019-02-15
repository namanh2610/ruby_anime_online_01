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
    return if @movie = Movie.select_movie
                            .where_movie_year(params[:id], compare).where_movie_status.page(params[:page])
                            .per(Settings.movie_type.value_item_movie)
    flash.now[:error] = t "movie_type.error"
    redirect_to root_path
  end
end
