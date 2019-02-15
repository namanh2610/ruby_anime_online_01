class Episode < ApplicationRecord
  belongs_to :movie
  has_many :comment_objects, as: :commentable

  scope :episode_properties, ->{select :id, :name, :url, :movie_id}
end
