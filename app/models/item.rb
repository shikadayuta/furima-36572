class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :scheduled_delivery

  has_one_attached :image
  belongs_to :user

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_price, presence: true
  validates :item_price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }, if: lambda { |u|
                                                                                                                         u.item_price.present?
                                                                                                                       }
  validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }, if: lambda { |u|
                                                                                                                                                      u.item_price.present?
                                                                                                                                                    }
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
end
"can't be blank"
