require 'rails_helper'

RSpec.describe UserRating, type: :model do
  let(:user_rating) do
    build(:user_rating)
  end

  describe 'Assocations' do
    it { is_expected.to belong_to(:recipe) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'rating' do
    context 'format' do
      it 'accepts 1-5' do
        user_rating.rating_value = 3

        expect(user_rating).to be_valid
      end

      it 'does not accept greater than range' do
        user_rating.rating_value = 10

        expect(user_rating).to_not be_valid
      end

      it 'does not accept less than range' do
        user_rating.rating_value = 0

        expect(user_rating).to_not be_valid
      end
    end
  end

end
