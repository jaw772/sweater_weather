require 'rails_helper'

RSpec.describe WeatherService do
  describe '::get_all_weather' do
    it 'returns a hash of weather based on a given location' do
      all_weather = WeatherService.get_all_weather(39, -104)

      expect(all_weather).to be_a Hash
      expect(all_weather).to have_key(:current)
      expect(all_weather).to have_key(:hourly)
      expect(all_weather).to have_key(:daily)
      expect(all_weather).to_not have_key(:minutely)
    end
  end
end
