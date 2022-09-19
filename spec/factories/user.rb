FactoryBot.define do
  factory :user do
    password { SecureRandom.hex }

    # jitera-anchor-dont-touch: columns
    email { Faker::Internet.unique.email(domain: 'uniqexample') }
  end
end
