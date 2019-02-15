class Admin::EpisodesController < ApplicationController
  layout "admin"

  def new
    @movie = Movie.find_by id: params[:id]
    @episode = @movie.episodes.build
  end

  def create
    @episode = Episode.new episode_params
    @movie = Movie.find_by id: episode_params[:movie_id]

    if @episode.save
      flash[:success] = t "admin.episodes.create.success"
    else
      flash[:danger] = t "admin.episodes.create.danger"
    end
    redirect_to admin_create_eipsode_path(id: episode_params[:movie_id])
  end

  def index
    @episodes = Episode.group_by_movie.page(params[:page]).per Settings.admin.movies.index.number_page
  end

  def update_episode
    @episode = Episode.find_by id: params[:id]

    if @episode.status == false
      @episode.update status: true
      flash[:success] = t "admin.episodes.update_episode.success"
    else
      flash[:danger] = t "admin.episodes.update_episode.danger"
    end
    redirect_to admin_episodes_path
  end

  private

  def episode_params
    params.require(:episode)
          .permit :name, :url, :movie_id
  end
end
