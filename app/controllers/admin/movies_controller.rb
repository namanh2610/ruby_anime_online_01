class Admin::MoviesController < ApplicationController
  before_action :logged_in_admin, only: %i(index create new update_movie edit update)
  before_action :list_movie_type, only: %i(create new)
  before_action :search_movie, only: %i(edit update)

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
    @movies = Movie.page(params[:page]).per Settings.admin.movies.index.number_page
  end

  def edit; end

  def update
    if @movie.update movie_params
      flash[:success] = t "admin.movies.update.success"
      redirect_to admin_index_path
    else
      flash[:danger]= t "admin.movies.update.danger"
      render :edit
    end
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

  def destroy
    @movie = Movie.find_by id: params[:id]
    @movie.destroy
    flash[:success] = t "admin.movies.destroy.success"
    redirect_to admin_movies_path
  end

  def list_movie_type
    @list = MovieType.all.map{|e| e.name}
  end

  private

  def movie_params
    params.require(:movie)
          .permit :name, :content, :total_episodes, images_attributes: [:id, :image], producers_attributes: [:id, :name, :email], movie_objects_attributes: [:id, :movie_type_id]
  end

  def logged_in_admin
    return false if logged_in?
    flash[:danger] = t "admin.movies.logged_in_admin.danger"
    redirect_to login_url
  end

  def search_movie
    @movie = Movie.find_by id: params[:id]
  end
end
