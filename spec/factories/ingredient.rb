FactoryBot.define do
  factory :ingredient do
    recipe

    # jitera-anchor-dont-touch: columns
    amount { 1.0 }
    unit { 'cup' }
  end
end
