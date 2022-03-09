require 'rails_helper'

RSpec.describe DirectionsFacade do
  it '::weather' do
    data = DirectionsFacade.directions('Denver,Co', 'Pueblo,Co')
    expect(data).to be_a Hash
    expect(data).to have_key(:route)
    expect(data).to have_key(:info)
  end
end
