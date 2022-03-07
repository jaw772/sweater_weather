class Api::V1::BooksController < ApplicationController

  def search
    location = WeatherFacade.coordinates(params[:location])
    weather = WeatherFacade.weather(location.lat, location.lon)
    data = BookFacade.books(location.city, params[:quantity])
    render json: BookSerializer.format_books(data, params[:location])
  end
end
