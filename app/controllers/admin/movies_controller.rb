class Admin::MoviesController < ApplicationController
  before_action :logged_in_admin, only: %i(index create new)
  before_action :list_movie_type, only: %i(create new)

  layout "admin"

  def new
    @movie = Movie.new
    @movie.images.build
    @movie.producers.build
    @movie.movie_objects.build
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      flash.now[:success] = t "admin.movies.create.success"
      redirect_to admin_index_path
    else
      flash.now[:danger] = t "admin.movies.create.danger"
      render :new
    end
  end

  def index
    @movies = Movie.sort_date.page(params[:page]).per Settings.admin.movies.index.number_page
  end

  def update_movie
    @movie = Movie.find_by id: params[:id]
    if @movie.status == false
      @movie.update status: true
      flash[:success] = t "admin.movies.update_movie.success"
    else
      flash[:danger] = t "admin.movies.update_movie.danger"
    end
    redirect_to admin_index_path
  end

  def list_movie_type
    @list = MovieType.all.map{|e| [e.name, e.id]}
  end

  private

  def movie_params
    params.require(:movie)
          .permit :name, :content, :total_episodes, images_attributes: [:image], producers_attributes: [:name, :email], movie_objects_attributes: [:movie_type_id]
  end

  def logged_in_admin
    return false if logged_in?
    flash[:danger] = t "admin.movies.logged_in_admin.danger"
    redirect_to login_url
  end
end
