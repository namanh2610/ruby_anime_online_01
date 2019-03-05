class MovieType < ApplicationRecord
  has_many :movie_objects
  has_many :movie, through: :movie_objects

  scope :movie_type, ->{select :name}
end
