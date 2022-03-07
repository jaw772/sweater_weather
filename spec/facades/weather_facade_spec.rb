require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '#weather' do
    it 'returns a hash with attributes: current_weather, daily_weather, and hourly_weather' do
      coords = WeatherFacade.coordinates("pueblo west,co")
      data = WeatherFacade.weather(coords.lat, coords.lon)

      expect(data).to be_a Hash
      expect(data[:current_weather])
    end
  end

  
