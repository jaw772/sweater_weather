require 'rails_helper'

RSpec.describe BackgroundService do
  describe '::get_background' do
    it 'returns a hash of photos based on a given location' do
      background = BackgroundService.get_background("Denver")

      expect(background).to be_a Hash
      expect(background).to have_key(:photos)
      expect(background[:photos]).to be_a Array
    end
  end
end
