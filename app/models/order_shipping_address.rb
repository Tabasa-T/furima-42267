class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id, :item_id, :city, :address
    validates :prefecture_id, numericality: {only_integer: true, other_than: 1}
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は「123-4567」の形式で入力してください" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "はハイフンなしの10〜11桁で入力してください" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end

end