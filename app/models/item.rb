class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :item_price
  end
  validates :item_price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }, if: lambda { |u|
                                                                                                                         u.item_price.present?
                                                                                                                       }
  validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }, if: lambda { |u|
                                                                                                                                                      u.item_price.present?
                                                                                                                                                    }
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_prefecture_id
    validates :item_shipping_fee_status_id
    validates :item_scheduled_delivery_id
  end
end
