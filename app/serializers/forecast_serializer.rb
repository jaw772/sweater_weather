class ForecastSerializer
  include JSONAPI::Serializer
  set_id 'null'
  set_type 'forecast'
  def self.format_weather(data)
    {
      'attributes': {
        'current_weather': {
          'dt': Time.at(data[:current][:dt]).strftime('%Y-%m-%d %H:%M:%S'),
          'sunrise': Time.at(data[:current][:sunrise]).strftime('%Y-%m-%d %H:%M:%S'),
          'sunset': Time.at(data[:current][:sunset]).strftime('%Y-%m-%d %H:%M:%S'),
          'temp': data[:current][:temp],
          'feels_like': data[:current][:feels_like],
          'humidity': data[:current][:humidity],
          'uvi': data[:current][:uvi],
          'visibility': data[:current][:visibility],
          'conditions': data[:current][:weather].first[:description],
          'icon': data[:current][:weather].first[:icon]
        },
        'daily_weather': data[:daily].first(5).map do |daily_weather|
          {
            'dt': Time.at(daily_weather[:dt]).to_date,
            'sunrise': Time.at(daily_weather[:sunrise]).strftime('%Y-%m-%d %H:%M:%S'),
            'sunset': Time.at(daily_weather[:sunset]).strftime('%Y-%m-%d %H:%M:%S'),
            'max_temp': daily_weather[:temp][:max],
            'min_temp': daily_weather[:temp][:min],
            'conditions': daily_weather[:weather].first[:description],
            'icon': data[:current][:weather].first[:icon]
          }
        end,
        'hourly_weather': data[:hourly].first(8).map do |hourly_weather|
          {
            'time': Time.at(hourly_weather[:dt]).strftime('%T'),
            'temperature': hourly_weather[:temp],
            'conditions': hourly_weather[:weather].first[:description],
            'icon': hourly_weather[:weather].first[:icon]
          }
        end
      }
    }
  end
end
