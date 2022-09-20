require 'swagger_helper'

RSpec.describe 'api/users_ratings', type: :request do
  before do
    create(:user_rating)
  end

  path '/api/users_ratings/{id}' do
    delete 'Destroy user_ratings' do
      tags 'delete'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'delete' do
        let(:resource_owner) { UserRating.last.user }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:user_rating).id }

        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['user_rating']['user_id']).to eq(resource_owner.id)
        end
      end

      response '200', 'delete failed' do
        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:user_rating).id }

        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['user_rating']).to eq(nil)
          expect(JSON.parse(response.body)['error_message']).to eq("failed to delete record!")
        end
      end
    end
  end

  path '/api/users_ratings/{id}' do
    put 'Update recipes' do
      tags 'update'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'update' do
        let(:resource_owner) { UserRating.last.user }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:id) { create(:user_rating).id }

        let(:params) do
          {
            rating_value: 1
          }
        end

        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['user_rating']['user_id']).to eq(resource_owner.id)
        end
      end
    end
  end

  path '/api/users_ratings/{id}' do
    get 'Show user_rating' do
      tags 'show'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'show' do
        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:recipe).id }

        run_test! do |response|
          expect(response.status).to eq(200)
          
        end
      end
    end
  end

  path '/api/users_ratings' do
    post 'Create recipes' do
      tags 'create'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'create' do
        let(:resource_owner) { UserRating.last.user }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) do
          {
            recipe_id: Recipe.last.id,
            rating_value: 3
          }
        end

        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['user_rating']['user_id']).to eq(resource_owner.id)
        end
      end

      response '200', 'create failed' do
        let(:resource_owner) { UserRating.last.user }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) do
          {
            recipe_id: nil,
            rating_value: nil
          }
        end

        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['user_rating']).to eq(nil)
          expect(JSON.parse(response.body)['error_object']).to eq("recipe must exist, rating_value can't be blank")
        end
      end
    end
  end

  path '/api/users_ratings' do
    get 'List recipes filtered by title' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]
      response '200', 'filter' do
        let(:resource_owner) { UserRating.last.user }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['user_ratings'].first['user_id']).to eq(resource_owner.id)
        end
      end
    end
  end
end
