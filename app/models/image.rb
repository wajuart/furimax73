class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :product

  validates_presence_of :src
end
