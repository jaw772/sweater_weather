require 'rails_helper'

RSpec.describe 'Session Creation' do
  let!(:user){User.create(email: 'wish@dog.com', password: 'password', password_confirmation: 'password')}
  describe 'POST sessions' do
    it 'returns a successful response' do
      user_params = {
        email: 'wish@dog.com',
        password: 'password',
      }
      post "/api/v1/sessions", params: user_params
      expect(response).to be_successful
    end
  end

  describe 'Sad paths/edge cases' do
    it 'returns an unsuccessful response if passwords dont match' do
      user_params = {
        email: 'wish@dog.com',
        password: 'password123'
      }
      post "/api/v1/sessions", params: user_params
      expect(response).to_not be_successful
    end

    it 'returns an unsuccessful response if password is blank' do
      user_params = {
        email: 'wish@dog.com',
        password: ''
      }
      post "/api/v1/sessions", params: user_params
      expect(response).to_not be_successful
    end

    it 'returns an unsuccessful response if email doesnt exists' do
      user_params = {
        email: 'fluffy@dog.com',
        password: 'password',
        password_confirmation: 'password'
      }
      post "/api/v1/sessions", params: user_params
      expect(response).to_not be_successful
    end
  end
end
