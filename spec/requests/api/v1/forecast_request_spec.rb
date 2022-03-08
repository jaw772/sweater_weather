require 'rails_helper'

RSpec.describe 'OpenWeather API Endpoint' do
  describe 'GET forecast' do
    before(:each) do
      get "/api/v1/forecast?location=denver,co"
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns a hash of weather data based on a given location' do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a Hash
      expect(data[:attributes].keys).to eq([:current_weather, :daily_weather, :hourly_weather])
      expect(data[:attributes][:daily_weather].size).to eq 5
      expect(data[:attributes][:hourly_weather].size).to eq 8
      expect(data[:attributes].keys).to_not eq(:minutely_weather )
    end

    it 'returns attributes of current_weather' do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:attributes][:current_weather].keys).to eq([:dt, :sunrise, :sunset, :temp, :feels_like, :humidity,
        :uvi, :visibility, :conditions, :icon])
    end
    it 'returns attributes of daily_weather' do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:attributes][:daily_weather].first.keys).to eq([:dt, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
    end
    it 'returns attributes of hourly_weather' do
      data = JSON.parse(response.body, symbolize_names: true)

        expect(data[:attributes][:hourly_weather].first.keys).to eq([:time, :temperature, :conditions, :icon])
    end
  end

  # describe 'edge cases/sad paths' do
  #   it 'returns a bad request if quantity is below 0' do
  #     get "/api/v1/book-search?location=denver,co&quantity=-4"
  #     data = JSON.parse(response.body, symbolize_names: true)
  #
  #     expect(response).to_not be_successful
  #     expect(data[:message]).to eq 'Quantity cannot be less than 0'
  #   end
  # end
end
