class Api::V1::RoadTripController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user == nil
      render status: 401
    else
      coords = WeatherFacade.coordinates(params[:destination])
      directions = DirectionsFacade.directions(params[:origin], params[:destination])
      weather = WeatherFacade.weather(coords.lat, coords.lon)
      render json: RoadTripSerializer.format_road_trip(directions, weather)
    end
  end
end
