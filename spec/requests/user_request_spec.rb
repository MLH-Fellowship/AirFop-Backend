# Tests the UsersController
require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  # Create 10 Users and save them to the database
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  # Tests the index ROUTE
  describe 'GET /users' do

    before { get '/users' }

    it 'returns users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Tests the SHOW function
  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    context 'when the user exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end


  # Tests the CREATE function
  describe 'POST /users/:id' do
    let(:valid_attributes) {
      { first_name: 'John', last_name: 'Doe',
        email: 'john.doe@somename.com', password: 'temppassword' } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['first_name']).to eq('John')
        expect(json['last_name']).to eq('Doe')
        expect(json['email']).to eq('john.doe@somename.com')
        expect(json['password']).to be_nil
        expect(json['password_digest']).to_not be_nil
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: valid_attributes }
      before { post '/users', params: valid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Email has already been taken/)
      end
    end
  end

  # Test suite for DELETE function
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
