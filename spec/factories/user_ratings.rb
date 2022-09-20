FactoryBot.define do
  factory :user_rating do
    user
    recipe

    rating_value { 5 }
  end
end
