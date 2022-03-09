require 'rails_helper'

RSpec.describe Coords do
  let(:json){File.read('spec/fixtures/coordinates.json')}
  let(:data){JSON.parse(json, symbolize_names: true)}
  let(:coords) { Coords.new(data) }
  describe 'initialize' do
    it 'exists' do
      actual = coords
      expected = Coords

      expect(actual).to be_a(expected)
    end
  end
  describe '#attributes' do
    it 'has a latitude' do
      actual = coords.lat
      expected = 39.738453
      expect(actual).to eq(expected)
    end

    it 'has a longitude' do
      actual = coords.lon
      expected = -104.984853
      expect(actual).to eq(expected)
    end
    it 'has a county' do
      actual = coords.county
      expected = 'Denver County'
      expect(actual).to eq(expected)
    end
    it 'has a city' do
      actual = coords.city
      expected = 'Denver'
      expect(actual).to eq(expected)
    end
  end
end
