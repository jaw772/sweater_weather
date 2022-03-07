class BookService

  def self.get_books(location, quantity)
    response = Faraday.get("http://openlibrary.org/search.json?title=#{location}&limit=#{quantity}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end 
