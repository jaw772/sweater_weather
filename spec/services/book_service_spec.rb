require 'rails_helper'

RSpec.describe BookService do
  describe '::get_books' do
    it 'returns a hash of books based on a given location' do
      books = BookService.get_books("Denver", "5")

      expect(books).to be_a Hash
      expect(books[:docs].size).to eq(5)
      expect(books).to have_key(:numFound)
      expect(books).to have_key(:docs)
      expect(books[:numFound]).to be_a Integer
      expect(books[:docs]).to be_a Array
    end
  end
end
