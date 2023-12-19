class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :user_id, :item_id, :city, :block
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid." }
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end