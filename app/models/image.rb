class Image < ApplicationRecord
  mount_uploader :picture , PictureUploader

  validates :description, presence: true
end
