require 'rails_helper'

RSpec.describe 'User Creation' do
  describe 'POST users' do
    it 'returns a successful response' do
      user_params = {
        email: 'wish@dog.com',
        password: 'password',
        password_confirmation: 'password'
      }
      post "/api/v1/users", params: user_params
      expect(response).to be_successful
    end
  end

  describe 'Sad paths/edge cases' do
    it 'returns an unsuccessful response if passwords dont match' do
      user_params = {
        email: 'wish@dog.com',
        password: 'password',
        password_confirmation: 'password123'
      }
      post "/api/v1/users", params: user_params
      expect(response).to_not be_successful
    end

    it 'returns an unsuccessful response if password confirmation is blank' do
      user_params = {
        email: 'wish@dog.com',
        password: 'password',
        password_confirmation: ''
      }
      post "/api/v1/users", params: user_params
      expect(response).to_not be_successful
    end

    it 'returns an unsuccessful response if email already exists' do
      user_params = {
        email: 'wish@dog.com',
        password: 'password',
        password_confirmation: 'password'
      }
      post "/api/v1/users", params: user_params

      user_params = {
        email: 'wish@dog.com',
        password: 'password',
        password_confirmation: 'password'
      }
      post "/api/v1/users", params: user_params
      expect(response).to_not be_successful
    end
  end
end
