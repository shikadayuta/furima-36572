FactoryBot.define do
  factory :item do
    item_name                   { 'name' }
    item_info                   { 'info' }
    item_price                  { 300 }
    item_category_id            { 2 }
    item_sales_status_id        { 2 }
    item_shipping_fee_status_id { 2 }
    item_prefecture_id          { 2 }
    item_scheduled_delivery_id  { 2 }
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
