class Producer < ApplicationRecord
  belongs_to :movie

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: Settings.producer.max_name}
  validates :email, presence: true, length: {maximum: Settings.producer.max_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
end
