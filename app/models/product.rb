class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
  
  accepts_nested_attributes_for :images, allow_destroy: true
end
