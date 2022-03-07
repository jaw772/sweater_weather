class BackgroundService
  def self.get_background(location)
    response = Faraday.get("https://api.pexels.com/v1/search?Authorization=#{ENV['pexels_key']}&query=#{location}&orientation=landscape")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
