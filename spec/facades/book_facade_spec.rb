require 'rails_helper'
require 'webmock/rspec'

RSpec.describe BookFacade do
  it '::books' do
    response = File.read('spec/fixtures/books.json')
    stub_request(:get, 'http://openlibrary.org/search.json?title=denver&limit=5')
      .to_return({
                   status: 200,
                   body: response
                 })
    books = BookFacade.books("denver", "5")
    expect(books[:docs].first[:title]).to eq 'East of Denver'
    expect(books[:docs].last[:title]).to eq 'Water-quality assessment for Arvada Reservoir, Denver metropolitan area, Colorado'
    expect(books[:docs].count).to eq(5)

  end
end
