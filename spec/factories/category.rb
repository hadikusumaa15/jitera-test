FactoryBot.define do
  factory :category do
    # jitera-anchor-dont-touch: columns
    description { Faker::Lorem.paragraph_by_chars(number: rand(0..1000)) }
  end
end
