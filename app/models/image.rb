class Image < ApplicationRecord
  mount_uploader :picture , PictureUploader
  validates :picture, presence: true
  validates :title, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :users
end
