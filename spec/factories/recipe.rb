FactoryBot.define do
  factory :recipe do
    category

    user

    # jitera-anchor-dont-touch: columns
    difficulty { 'easy' }
    time { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
    descriptions { Faker::Lorem.paragraph_by_chars(number: rand(0..1000)) }
    title { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }

    factory :recipe_fixed do
      difficulty { 'challenging' }
      time { 300 }
      descriptions { 'Sushi with beef flavor and spicy flame' }
      title { 'Flame Champion Sushi' }
    end
  end
end
