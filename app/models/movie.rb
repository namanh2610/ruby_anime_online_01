class Movie < ApplicationRecord
  belongs_to :user
  has_many :movie_objects
  has_many :comment_objects, as: :commentable
  has_many :producers
  has_many :images
  has_many :episodes
end
