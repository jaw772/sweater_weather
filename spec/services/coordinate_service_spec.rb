require 'rails_helper'

RSpec.describe CoordinateService do
  describe '::get_coordinates' do
    it 'returns an instance of Coords based on a given location' do
      coords = CoordinateService.get_coordinates("Denver,co")

      expect(coords).to be_a Coords
    end
  end
end
