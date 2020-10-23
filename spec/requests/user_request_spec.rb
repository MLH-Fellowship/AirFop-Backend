# Tests the UsersController
require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  # Create 10 Users and save them to the database
  let!(:users) { create_list(:user, 10) }

  # Tests the GET /users route
  describe 'GET /users' do

    before { get '/users' }

    context 'when records exist' do
      it 'returns users' do
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
