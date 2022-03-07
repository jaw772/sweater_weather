class CoordinateService
  def self.get_coordinates(location)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['mapquest_key']}&location=#{location}")
    json = JSON.parse(response.body, symbolize_names: true)
    Coords.new(json)
  end
end
