FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    prefecture_id {2}
    city {"渋谷区"}
    house_number {"1-1"}
    building_name {"渋谷ビル"}
    phone_number {"09012345678"}
    user_id {1}
    item_id {1}
  end
end
