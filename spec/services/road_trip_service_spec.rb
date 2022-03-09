require 'rails_helper'

RSpec.describe RoadTripService do
  describe '::get_directions' do
    it 'returns a hash of directions based on a given origin and destination' do
      directions = RoadTripService.get_directions("Denver,Co", "Pueblo,Co")

      expect(directions).to be_a Hash
      expect(directions).to have_key(:route)
      expect(directions[:route]).to have_key(:routeError)
      expect(directions[:route]).to have_key(:time)
      expect(directions[:route]).to be_a Hash
      expect(directions[:route][:routeError]).to be_a Hash
      expect(directions[:route][:time]).to be_a Integer
    end
  end
end
