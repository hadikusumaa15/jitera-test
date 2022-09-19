# frozen_string_literal: true

require 'swagger_helper'

describe 'User change password API' do
  path '/api/users_passwords' do
    put 'change password' do
      tags 'Change password'
      consumes 'application/json'
      security [bearerAuth: []]

      parameter name: :new_password, in: :body, schema: {
        type: :object,
        properties: {
          new_password: { type: :string, example: 'dummy_new_password' }
        }
      }

      let(:resource_owner) { create(:user) }
      let(:token) { create(:access_token, resource_owner: resource_owner).token }
      let(:Authorization) { "Bearer #{token}" }

      response '200', 'Password updated' do
        examples 'application/json' => {
          success: true
        }

        let(:new_password) do
          {
            new_password: 'dummy_new_password'
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['success']).to be_truthy
        end
      end

      response '200', 'Cannot update password' do
        examples 'application/json' => {
          success: false
        }

        let(:new_password) do
          {
            new_password: '1'
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)

          expect(data['success']).to be_falsy
        end
      end
    end
  end
end
