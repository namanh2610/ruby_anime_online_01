class Episode < ApplicationRecord
  belongs_to :movie
  has_many :comment_objects, as: :commentable
end
