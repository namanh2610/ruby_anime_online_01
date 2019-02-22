class Movie < ApplicationRecord
  belongs_to :user
  has_many :movie_objects
  has_many :comment_objects, as: :commentable
  has_many :producers
  has_many :images
  has_many :episodes

  scope :oder_name, ->{order name: :ASC}
  scope :select_movie, ->{select :id, :name, :content}

  MOVIE_TYPE = %w(new update series).freeze

  def default_image movie_id
    Movie.find_by(id: movie_id).images.sample.image
  end
end
