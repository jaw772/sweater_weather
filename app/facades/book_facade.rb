class BookFacade

  def self.books(location, quantity)
    BookService.get_books(location, quantity)
  end
end
