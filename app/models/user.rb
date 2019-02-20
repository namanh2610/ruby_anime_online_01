class User < ApplicationRecord
  belongs_to :user_role
  has_many :movies
  has_many :comment_objects
end
