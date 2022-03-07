class WeatherFacade
  def self.coordinates(location)
    CoordinateService.get_coordinates(location)
  end

  def self.weather(lat, lon)
    WeatherService.get_all_weather(lat, lon)
  end

  def self.background(location)
    BackgroundService.get_background(location)
  end 
end
