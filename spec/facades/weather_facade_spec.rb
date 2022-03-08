require 'rails_helper'

RSpec.describe WeatherFacade do
  it '::weather' do
    data = WeatherFacade.weather(39.73845, -104.98485)
    expect(data).to be_a Hash
    expect(data[:lat]).to eq 39.7385
    expect(data[:lon]).to eq -104.9849
    expect(data.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
  end

  it '::coordinates' do
    data = WeatherFacade.coordinates("palmer lake,co")
    expect(data).to be_a Coords
    expect(data.lat).to eq 39.101463
    expect(data.lon).to eq -104.882056
  end

  it '::background' do
    data = WeatherFacade.background("denver,co")
    expect(data).to be_a Hash
    expect(data.keys).to eq([:page, :per_page, :photos, :total_results, :next_page])
  end
end
