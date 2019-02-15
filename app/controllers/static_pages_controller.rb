class StaticPagesController < ApplicationController
  def home
    Movie::MOVIE_TYPE.each do |type|
      instance_variable_set "@movie_#{type}",
        Movie.movie_properties.check_status_movie.sort_date.page(params[:page])
          .per(Settings.home.send("value_item_movie_#{type}"))
    end
    @movie_series = Movie.movie_properties
      .check_status_movie.get_movie_by_total_episode.sort_date.page(params[:page])
      .per Settings.home.value_item_movie_series
  end
end
