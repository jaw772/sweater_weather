require 'rails_helper'

RSpec.describe BookFacade do
  it '#get_books' do
    response = File.read('spec/fixtures/books.json')
    stub_request(:get, 'http://openlibrary.org/subjects/denver.json?limit=5')
      .to_return({
                   status: 200,
                   body: response
                 })

    expect(BookFacade.get_books('1').first).to be_a Book
    expect(BookFacade.get_books('1').last).to be_a Book
    expect(BookFacade.get_books('1').count).to eq(5)

  end
end
