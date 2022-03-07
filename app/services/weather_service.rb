class WeatherService

  def self.get_all_weather(lat, lon)
    conn = Faraday.new(url: "https://api.openweathermap.org") do |f|
      f.params[:lat] = lat
      f.params[:lon] = lon
      f.params[:exclude] = "minutely"
      f.params[:units] = "imperial"
      f.params[:appid] = ENV['weather_api_key']
    end

    response = conn.get("/data/2.5/onecall")
    JSON.parse(response.body, symbolize_names: true)
  end
end
