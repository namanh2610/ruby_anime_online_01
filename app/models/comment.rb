class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  mount_uploader :image, PictureUploader

  scope :sort_date, ->{order created_at: :DESC}
end
