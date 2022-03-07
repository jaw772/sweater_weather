class Api::V1::ForecastController < ApplicationController
  def index
    coords = WeatherFacade.coordinates(params[:location])
    data = WeatherFacade.weather(coords.lat, coords.lon)
    render json: ForecastSerializer.format_weather(data)
  end
end
