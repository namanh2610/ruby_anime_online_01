class Episode < ApplicationRecord
  validates :name, presence: true, length: {maximum: Settings.episode.max_name}
  validates :url, presence: true, length: {maximum: Settings.episode.max_link}

  belongs_to :movie
  has_many :comment_objects, as: :commentable

  scope :group_by_movie, ->{order movie_id: :ASC}
end
