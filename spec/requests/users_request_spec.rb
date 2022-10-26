require 'rails_helper'
RSpec.describe 'Users Controller', type: :request do

    describe "GET /index" do
        before do
            get '/'
        end
       
        it 'return correct response status' do
            expect(response).to have_http_status(:ok)
          end

        it "correct template was rendere" do 
            expect(response).to render_template(:index)
        end

        it "response body includes correct placeholder text" do
            expect(response.body).to include("user data will display")
        end

    end

    describe "GET /show" do
        before do
            get '/users/1'
        end
       
        it 'return correct response status' do
            expect(response).to have_http_status(:ok)
          end

        it "correct template was rendere" do 
            expect(response).to render_template(:show)
        end

        it "response body includes correct placeholder text" do
            expect(response.body).to include("User details will display")
        end

    end
  
end
