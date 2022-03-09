require 'rails_helper'

RSpec.describe 'Road Trip' do
  let!(:user){User.create(email: 'wish@dog.com', password: 'password', password_confirmation: 'password')}
  describe 'POST road_trip' do
    it 'returns a successful response' do
      trip_params = {
        origin: 'Denver,Co',
        destination: 'Pueblo,Co',
        api_key: user.api_key
      }
      post "/api/v1/road_trip", params: trip_params
      expect(response).to be_successful
    end
  end

  describe 'Sad paths/edge cases' do
    it 'returns status code 401 if api key doesnt match a current user' do
      trip_params = {
        origin: 'Denver,Co',
        destination: 'Pueblo,Co',
        api_key: '333'
      }
      post "/api/v1/road_trip", params: trip_params
      expect(response).to_not be_successful
    end

    it 'returns impossible for travel if it cant be done' do
      trip_params = {
        origin: 'Denver,Co',
        destination: 'Dublin,Ireland',
        api_key: user.api_key
      }
      post "/api/v1/road_trip", params: trip_params
      data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(data[:attributes][:travel_time]).to eq 'Impossible'
    end
  end
end
