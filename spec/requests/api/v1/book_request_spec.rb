require 'rails_helper'

RSpec.describe 'Openlibrary API Endpoint' do
  describe 'GET book-search' do
    before(:each) do
      get "/api/v1/book-search?location=denver,co&quantity=5"
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns a hash of books based on a given location' do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a Hash
      expect(data[:attributes].keys).to eq([:destination, :forecast, :total_books_found, :books])
    end
  end
end
