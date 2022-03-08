class Coords
  attr_reader :lat, :lon, :county, :city

  def initialize(data)
    result = data[:results].first
    location = result[:locations].first
    @lat = location[:latLng][:lat]
    @lon = location[:latLng][:lng]
    @county = location[:adminArea4]
    @city = location[:adminArea5]
  end
end
