class Movie < ApplicationRecord
  MOVIE_TYPE = %w(new update series).freeze

  belongs_to :user
  has_many :movie_objects
  has_many :comment_objects, as: :commentable
  has_many :producers
  has_many :images
  has_many :episodes
  has_many :movie_types, through: :movie_objects

  scope :oder_name, ->{order name: :ASC}
  scope :select_movie, ->{select :id, :name, :content}
  scope :select_detail, ->{select :id, :name, :content, :total_episodes, :updated_at}

  def select_status
    episodes.count == total_episodes ? "Hoàn thành" : "Chưa hoàn thành"
  end
end
