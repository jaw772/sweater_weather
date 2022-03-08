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
      expect(data[:attributes][:books].size).to eq 5
      expect(data[:attributes].keys).to_not eq([:min_temp, :max_temp] )
    end

    it 'returns attributes of books that are isbn, title, and publisher ' do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:attributes][:books].first.keys).to eq([:isbn, :title, :publisher])
    end
  end

  describe 'edge cases/sad paths' do
    it 'returns a bad request if quantity is below 0' do
      get "/api/v1/book-search?location=denver,co&quantity=-4"
      data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(data[:message]).to eq 'Quantity cannot be less than 0'
    end
  end
end
