require 'rails_helper'

RSpec.describe BookFacade do
  it '#get_books' do
    response = File.read('spec/fixtures/books.json')
    stub_request(:get, 'http://openlibrary.org/search.json?title=denver&limit=5')
      .to_return({
                   status: 200,
                   body: response
                 })

    expect(BookFacade.books[:attributes][:books].first).to be_a Book
    expect(BookFacade.books[:attributes][:books].last).to be_a Book
    expect(BookFacade.books[:attributes][:books].count).to eq(5)

  end
end
