class StaticPagesController < ApplicationController
  def home
    Movie::MOVIE_TYPE.each do |type|
      instance_variable_set "@movie_#{type}",
        Movie.select_movie.oder_name.page(params[:page])
             .per(Settings.home.send("value_item_movie_#{type}"))
    end
  end
end
