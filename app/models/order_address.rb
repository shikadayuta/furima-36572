class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :home_num, :building_name, :tel, :item_id, :user_id

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code
    validates :city
    validates :home_num
    validates :tel
  end

  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }, if: lambda { |u|
    u.post_code.present?
  }

  validates :tel, format: {with: /\A[0-9]{11}\z/ }, if: lambda { |u|
    u.tel.present?
  }



  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, home_num: home_num, building_name: building_name, tel: tel, order_id: order.id)

  end



end