Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
    root "static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :movies, only: [:show]
    resources :users
    namespace :admin do
      get "/index", to: "movies#index"
      patch "/update_movie/:id", to: "movies#update_movie", as: "update_movie"
      get "/movie/new", to: "movies#new", as: "create_movie"
      get "/admin/episodes/new/:id", to: "episodes#new", as: "create_eipsode"
      patch "/update_episode/:id", to: "episodes#update_episode", as: "update_episode"
      resources :movies
      resources :episodes
    end
    resources :movie_types
    resources :movie_type_years
  end
end
