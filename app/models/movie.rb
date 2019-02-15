class Movie < ApplicationRecord
  MOVIE_TYPE = %w(new update).freeze
  YEAR = %w(0 1 2 3 4 5).freeze

  validates :name, presence: true, length: {maximum: Settings.movie.max_name}
  validates :content, presence: true, length: {minimum: Settings.movie.min_content}
  validates :total_episodes, presence: true, numericality: {only_integer: true}

  belongs_to :user
  has_many :movie_objects
  has_many :comments
  has_many :producers
  has_many :images
  has_many :episodes
  has_many :movie_types, through: :movie_objects
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :producers
  mount_uploader :image, PictureUploader

  scope :sort_date, ->{order created_at: :DESC}
  scope :movie_properties, ->{select :id, :name, :content, :created_at}
  scope :detail_properties, ->{select :id, :name, :content, :total_episodes, :updated_at}
  scope :get_movie_by_year, ->(year, compare){where "extract(year from created_at)#{compare}?", year}
  scope :get_movie_by_total_episode, ->{where "total_episodes > '#{Settings.total_episode}'"}
  scope :check_status_movie, ->{where "status = '#{Settings.status}'"}
  scope :search_movie_by_name, ->(name){where "name LIKE '#{name}%' or name LIKE '%#{name}%' or name LIKE '%#{name}'"}

  def select_status
    episodes.count == total_episodes ? I18n.t("movie_detail.finish") : I18n.t("movie_detail.unfinished")
  end
end
