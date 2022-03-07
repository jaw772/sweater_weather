class Api::V1::BackgroundController < ApplicationController
  def index
    location = WeatherFacade.get_coordinates(params[:location])
    data = WeatherFacade.get_background(location.county)
    render json: BackgroundSerializer.format_background(data, location.county)
  end
end
