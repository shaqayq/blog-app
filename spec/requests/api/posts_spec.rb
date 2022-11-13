require 'swagger_helper'

RSpec.describe 'api/users/posts', type: :request do
  path '/api/v1/users/{user_id}/posts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show post') do
      response(200, 'successful') do
        user = User.create(name: 'Example User', photo: 'example.jpg', bio: 'Teacher from Nigeria.')
        post = Post.create(user_id: user.id, title: 'Hello', text: 'This is my test post')

        let(:user_id) { user.id }
        let(:id) { post.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
