require 'swagger_helper'

RSpec.describe 'api/recipes', type: :request do
  before do
    create(:recipe)
    create(:recipe_fixed)
  end

  # jitera-hook-for-rswag-example

  path '/api/recipes/{id}' do
    delete 'Destroy recipes' do
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
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'title' => 'string',
            'descriptions' => 'text',
            'time' => 'string',
            'difficulty' => 'enum_type',
            'category_id' => 'foreign_key',
            'ingredients' =>
            [
              {
                'id' => 'integer',
                'created_at' => 'datetime',
                'updated_at' => 'datetime',
                'unit' => 'enum_type',
                'amount' => 'float',
                'recipe_id' => 'foreign_key'
              }
            ],
            'user_id' => 'foreign_key'
          },
          'error_message' => 'string'
        }

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

  path '/api/recipes/{id}' do
    put 'Update recipes' do
      tags 'update'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :string,
                example: 'string'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'string',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
      [
        {

          'id' => 'integer',

          'created_at' => 'datetime',

          'updated_at' => 'datetime',

          'unit' => 'enum_type',

          'amount' => 'float',

          'recipe_id' => 'foreign_key'

        }
      ],

            'user_id' => 'foreign_key'

          },

          'error_object' => {}

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:id) { create(:recipe).id }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes/{id}' do
    get 'Show recipes' do
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
          expect(JSON.parse(response.body)['recipe']['user_rating_value'].present?).to eq(true)
        end
      end
    end
  end

  path '/api/recipes' do
    post 'Create recipes' do
      tags 'create'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :string,
                example: 'string'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'title' => 'string',
            'descriptions' => 'text',
            'time' => 'string',
            'difficulty' => 'enum_type',
            'category_id' => 'foreign_key',
            'ingredients' =>
            [
              {

                'id' => 'integer',

                'created_at' => 'datetime',

                'updated_at' => 'datetime',

                'unit' => 'enum_type',

                'amount' => 'float',

                'recipe_id' => 'foreign_key'

              }
            ],

            'user_id' => 'foreign_key'

          },

          'error_object' => {}

        }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes?title=sushi' do
    get 'List recipes filtered by title' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :string,
                example: 'string'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          },
          pagination_page: {
            type: :pagination_page,
            example: 'pagination_page'
          },
          pagination_limit: {
            type: :pagination_limit,
            example: 'pagination_limit'
          }
        }
      }
      response '200', 'filter' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'recipes' =>
            [
              {
                'id' => 'integer',
                'created_at' => 'datetime',
                'updated_at' => 'datetime',
                'title' => 'string',
                'descriptions' => 'text',
                'time' => 'string',
                'difficulty' => 'enum_type',
                'category_id' => 'foreign_key',
                'ingredients' =>
                  [
                    {
                      'id' => 'integer',
                      'created_at' => 'datetime',
                      'updated_at' => 'datetime',
                      'unit' => 'enum_type',
                      'amount' => 'float',
                      'recipe_id' => 'foreign_key'
                    }
                  ],
            'user_id' => 'foreign_key'

          }
        ],
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end

    get 'List title filtered recipes' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]

      response '200', 'filter' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'recipes' =>
            [
              {
                'id' => 'integer',
                'created_at' => 'datetime',
                'updated_at' => 'datetime',
                'title' => 'string',
                'descriptions' => 'text',
                'time' => 'string',
                'difficulty' => 'enum_type',
                'category_id' => 'foreign_key',
                'ingredients' =>
                  [
                    {
                      'id' => 'integer',
                      'created_at' => 'datetime',
                      'updated_at' => 'datetime',
                      'unit' => 'enum_type',
                      'amount' => 'float',
                      'recipe_id' => 'foreign_key'
                    }
                  ],
            'user_id' => 'foreign_key'

          }
        ],
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['recipes'].first['title']).to eq("Flame Champion Sushi")
          expect(JSON.parse(response.body)['recipes'].first['user_rating_value'].present?).to eq(true)
        end
      end
    end
  end

  path '/api/recipes?min_time=9990&max_time=9999' do
    get 'List recipes filtered by time' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :string,
                example: 'string'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          },
          pagination_page: {
            type: :pagination_page,
            example: 'pagination_page'
          },
          pagination_limit: {
            type: :pagination_limit,
            example: 'pagination_limit'
          }
        }
      }
      response '200', 'filter' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'recipes' =>
            [
              {
                'id' => 'integer',
                'created_at' => 'datetime',
                'updated_at' => 'datetime',
                'title' => 'string',
                'descriptions' => 'text',
                'time' => 'string',
                'difficulty' => 'enum_type',
                'category_id' => 'foreign_key',
                'ingredients' =>
                  [
                    {
                      'id' => 'integer',
                      'created_at' => 'datetime',
                      'updated_at' => 'datetime',
                      'unit' => 'enum_type',
                      'amount' => 'float',
                      'recipe_id' => 'foreign_key'
                    }
                  ],
            'user_id' => 'foreign_key'

          }
        ],
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end

    get 'List title filtered recipes' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]

      response '200', 'filter' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'recipes' =>
            [
              {
                'id' => 'integer',
                'created_at' => 'datetime',
                'updated_at' => 'datetime',
                'title' => 'string',
                'descriptions' => 'text',
                'time' => 'string',
                'difficulty' => 'enum_type',
                'category_id' => 'foreign_key',
                'ingredients' =>
                  [
                    {
                      'id' => 'integer',
                      'created_at' => 'datetime',
                      'updated_at' => 'datetime',
                      'unit' => 'enum_type',
                      'amount' => 'float',
                      'recipe_id' => 'foreign_key'
                    }
                  ],
            'user_id' => 'foreign_key'

          }
        ],
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['recipes'].first['title']).to eq("Flame Champion Sushi")
        end
      end
    end
  end

  path '/api/recipes?difficulty=challenging' do
    get 'List recipes filtered by difficulty' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :string,
                example: 'string'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          },
          pagination_page: {
            type: :pagination_page,
            example: 'pagination_page'
          },
          pagination_limit: {
            type: :pagination_limit,
            example: 'pagination_limit'
          }
        }
      }
      response '200', 'filter' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'recipes' =>
            [
              {
                'id' => 'integer',
                'created_at' => 'datetime',
                'updated_at' => 'datetime',
                'title' => 'string',
                'descriptions' => 'text',
                'time' => 'string',
                'difficulty' => 'enum_type',
                'category_id' => 'foreign_key',
                'ingredients' =>
                  [
                    {
                      'id' => 'integer',
                      'created_at' => 'datetime',
                      'updated_at' => 'datetime',
                      'unit' => 'enum_type',
                      'amount' => 'float',
                      'recipe_id' => 'foreign_key'
                    }
                  ],
            'user_id' => 'foreign_key'

          }
        ],
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end

    get 'List title filtered recipes' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]

      response '200', 'filter' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'recipes' =>
            [
              {
                'id' => 'integer',
                'created_at' => 'datetime',
                'updated_at' => 'datetime',
                'title' => 'string',
                'descriptions' => 'text',
                'time' => 'string',
                'difficulty' => 'enum_type',
                'category_id' => 'foreign_key',
                'ingredients' =>
                  [
                    {
                      'id' => 'integer',
                      'created_at' => 'datetime',
                      'updated_at' => 'datetime',
                      'unit' => 'enum_type',
                      'amount' => 'float',
                      'recipe_id' => 'foreign_key'
                    }
                  ],
            'user_id' => 'foreign_key'

          }
        ],
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['recipes'].first['title']).to eq("Flame Champion Sushi")
        end
      end
    end
  end
end
