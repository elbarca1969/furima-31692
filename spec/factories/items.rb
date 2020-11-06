FactoryBot.define do
  factory :item do
    item_name {Faker::Name.name}
    content {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    delivery_fee_id {2}
    prefecture_id {2}
    ship_day_id {2}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
