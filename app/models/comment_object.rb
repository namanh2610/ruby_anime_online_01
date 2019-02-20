class CommentObject < ApplicationRecord
  belongs_to :movie
  belongs_to :episode
  belongs_to :commentable, polymorphic: true
end
