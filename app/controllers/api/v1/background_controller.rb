class Api::V1::BackgroundController < ApplicationController
  def index
    location = WeatherFacade.coordinates(params[:location])
    data = WeatherFacade.background(location.county)
    render json: BackgroundSerializer.format_background(data, location.county)
  end
end
