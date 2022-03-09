class RoadTripService
  def self.get_directions(start_city, end_city)
    response = Faraday.get("http://www.mapquestapi.com/directions/v2/route?key=#{ENV['mapquest_key']}&from=#{start_city}&to=#{end_city}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
