require 'swagger_helper'

RSpec.describe 'api/unit_converters', type: :request do
  path '/api/unit_converters?desired_unit=kilogram&current_value=100&current_unit=gram' do
    get 'unit_converters with correct parameters' do
      tags 'index'
      consumes 'application/json'
      response '200', 'index' do
        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['error_message']).to_not eq("Conversion Error")
          expect(JSON.parse(response.body)['current_value']).to eq(100)
          expect(JSON.parse(response.body)['current_unit']).to eq('gram')
          expect(JSON.parse(response.body)['desired_value']).to eq(0.1)
          expect(JSON.parse(response.body)['desired_unit']).to eq('kilogram')
        end
      end
    end
  end

  path '/api/unit_converters' do
    get 'unit_converters without parameters' do
      tags 'index'
      consumes 'application/json'
      response '200', 'index' do
        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['error_message']).to eq("Conversion Error")
        end
      end
    end
  end
end
