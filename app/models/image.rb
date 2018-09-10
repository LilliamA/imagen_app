class Image < ApplicationRecord
  mount_uploader :picture , PictureUploader
  validates :picture, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
