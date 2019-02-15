class Movie < ApplicationRecord
  MOVIE_TYPE = %w(new update series).freeze
  YEAR = %w(0 1 2 3 4 5).freeze

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
  scope :where_movie_year, ->(id, type){where "extract(year from created_at)#{type}?", id}
  scope :where_movie_status, ->{where "status = '1'"}

  def select_status
    episodes.count == total_episodes ? I18n.t("movie_detail.finish") : I18n.t("movie_detail.unfinished")
  end
end
