class BackgroundSerializer
  include JSONAPI::Serializer
  set_id 'null'
  set_type 'books'
  def self.format_books(data, location, weather)
    {
      'attributes': {
        'destination': location,
          'forecast': {
            'summary': data[:photos].first[:src][:original],
            'temperature':
          },
          'total_books_found': data[:numFound],
          'books': data[:docs].map do |book|
            {
            'isbn': book[:isbn].first(5),
            'title': book[:title],
            'publisher': book[:publisher].first(5)
            }
        }
      }
    }
  end
end
