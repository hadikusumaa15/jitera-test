# frozen_string_literal: true

require 'swagger_helper'

describe 'Verify reset password request API' do
  path '/api/users_verify_reset_password_requests' do
    post 'Verify reset password request' do
      tags 'Verify reset password request'
      consumes 'application/json'

      parameter name: :owner_fields, in: :body, schema: {
        type: :object,
        properties: {
          reset_token: { type: :string, example: 'dummy_reset_token' },
          password: { type: :string, example: 'dummy_password' },
          password_confirmation: { type: :string, example: 'dummy_password' }
        }
      }

      response '200', 'request sent' do
        let(:user) { User.find_by(email: 'user@jitera.com') || FactoryBot.create(:user, email: 'user@jitera.com') }
        let(:token) { user.generate_reset_password_token }

        examples 'application/json' => {
          success: true
        }

        let(:owner_fields) do
          {
            reset_token: token,
            password: 'dummy_password',
            password_confirmation: 'dummy_password'
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['success']).to be_truthy
        end
      end
    end
  end
end
