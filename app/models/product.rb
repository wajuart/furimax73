class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  belongs_to_active_hash :brand
  belongs_to_active_hash :size
  belongs_to_active_hash :status
  belongs_to_active_hash :shippingcost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shippingdays
  belongs_to_active_hash :shipping

  scope :search, -> (search){ where('name LIKE(?)', "%#{search}%")}
  
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :price, :description, :status_id, :size_id, :shippingcost_id, :shippingdays_id, :prefecture_id, :category_id, :shipping_id, presence: true
end
