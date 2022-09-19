# frozen_string_literal: true

require 'swagger_helper'

describe 'Send OTP codes API' do
  path '/api/users_sessions' do
    post 'Sign in by email' do
      tags 'Sign in by email'
      consumes 'application/json'

      parameter name: :owner_fields, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'user@jitera.com' },
          password: { type: :string, example: 'dummy_password' }
        }
      }

      response '200', 'user created' do
        user = User.find_by(email: 'user_1@jitera.com') || FactoryBot.create(:user, email: 'user_1@jitera.com')
        examples 'application/json' => {
          user: {
            id: user.id,
            email: user.email,
            password: user.password,
            phone: nil,
            name: nil,
            created_at: '2021-12-02T16:55:50.696+09:00',
            updated_at: '2021-12-02T16:55:50.696+09:00'
          },
          access_token: {
            token: 'eyJraWQiOiI0alU4RTNvZEh0QmFlekJtVV9qMkNRQjBLTjdNSWQ4ZTZoNS1YTEFYY0pFIiwiYWxnIjoiSFM1MTIifQ.eyJpYXQiOjE2NDI0Mzk2ODIsImp0aSI6IjViMWRiYjdjLWJlYjItNGIyOC1hZDc3LWFlYTI2YWRkMGRjYSIsInVzZXIiOnsiaWQiOjIsImVtYWlsIjoic3Nzc3NzYUBnbWFpbC5jb20ifX0.kyhvj_rwVeZojtq_FpxofPEZxCPxHAm-iECkgkTUUWuID-mV12VOeThr-GfpmNiVsGgWq5rPoPmVai7F6f0Izg'
          },
          success: true
        }

        let(:owner_fields) do
          {
            email: 'user_001@jitera.co',
            password: 'dummy_password'
          }
        end

        before do
          user_001 = create(:user, email: 'user_001@jitera.co')
          user_001.update(password: 'dummy_password')
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['success']).to be_truthy
        end
      end

      response '200', 'Cannot register' do
        examples 'application/json' => {
          error_message: '許可されていない動作です'
        }

        let(:owner_fields) do
          {
            email: 'invalid_email',
            password: 'dummy_password'
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)

          expect(data['error_message']).to eq('許可されていない動作です')
        end
      end
    end
  end
end
