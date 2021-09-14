FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    home_num { '1-1' }
    building_name { '東京ハイツ' }
    tel {"00000000000"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
