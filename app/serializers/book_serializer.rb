class BookSerializer
  include JSONAPI::Serializer
  set_id 'null'
  set_type 'books'
  def self.format_books(data, location, weather)
    {
      'attributes': {
        'destination': location,
        'forecast': {
          'summary': weather[:current][:weather].first[:description],
          'temperature':weather[:current][:temp]
        },
        'total_books_found': data[:numFound],
        'books': data[:docs].map do |book|
          {
          'isbn': book[:isbn],
          'title': book[:title],
          'publisher': book[:publisher]
          }
        end
      }
    }
  end
end
