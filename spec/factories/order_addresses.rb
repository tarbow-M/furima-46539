FactoryBot.define do
  factory :order_address do
    postal_code    { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    city           { '横浜市緑区' }
    street_address { '青山1-1-1' }
    building       { '柳ビル103' }
    phone_number   { Faker::Number.number(digits: 11).to_s }
    token          { "tok_#{Faker::Alphanumeric.alphanumeric(number: 28)}" }
  end
end
