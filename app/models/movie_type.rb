class MovieType < ApplicationRecord
  has_many :movie_objects
  has_many :movie, through: :movie_objects

  scope :select_movie_type, ->{select :name}
  scope :select_movie, ->{select :id, :name, :content}
end
