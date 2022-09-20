class UserRating < ApplicationRecord
  belongs_to :user
  belongs_to  :recipe

  validates :rating_value, comparison: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
