class Api::V1::BooksController < ApplicationController

  def search
    if params[:quantity].to_i > 0
      location = WeatherFacade.coordinates(params[:location])
      weather = WeatherFacade.weather(location.lat, location.lon)
      data = BookFacade.books(location.city, params[:quantity])
      render json: BookSerializer.format_books(data, params[:location], weather)
    else
      bad_request
    end
  end

  private

  def bad_request
    payload = {
      message: 'Quantity cannot be less than 0',
      code: 400,
      status: 'BAD REQUEST'
    }
    render json: payload, status: :bad_request
  end
end
