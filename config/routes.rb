Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :movies, only: [:show]
    resources :user
    namespace :admin do
      get "/index", to: "movies#index"
      patch "/update_movie/:id", to: "movies#update_movie", as: "update_movie"
      get "/movie/new", to: "movies#new", as: "create_movie"
      resources :movies
    end
    resources :movie_types
    resources :movie_type_years
    resources :movie_searchs
    resources :watch_movies
    resources :comments
  end
end
