class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :delivery_time

  validates :item_name, :description, :image, presence: true
  validates :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_time_id, numericality: { other_than: 1 , message: "can't be blank"}
end