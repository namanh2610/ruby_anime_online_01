class WatchMoviesController < ApplicationController
  def show
    @episodes = Episode.episode_properties.where(movie_id: params[:id].split(Settings.watch_movie.split_equal).last.to_i)

    if @episodes
      @movie = Movie.movie_properties.find_by id: params[:id].split(Settings.watch_movie.split_equal).last.to_i
      @showepisodes = Episode.episode_properties.find_by id: params[:id_episode].split(Settings.watch_movie.split_equal).last.to_i
      @comments = @movie.comments
        .sort_date.page(params[:page]).per Settings.watch_movie.value_item
      @comment = @movie.comments.build
    else
      flash.now[:errosr] = t "movie_detail.error"
      redirect_to root_path
    end
  end
end
