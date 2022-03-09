class RoadTripSerializer
  include JSONAPI::Serializer
  set_id 'null'
  set_type 'roadtrip'
  def self.format_road_trip(directions, weather)
    if directions[:route][:routeError][:errorCode] == -400
      time = directions[:route][:time]/60/60.to_f
      arrival_weather = weather[:hourly][time.round]
      duration = Time.at(directions[:route][:time]).utc.strftime('%H:%M')
      start = directions[:route][:locations].first[:adminArea5]
      final = directions[:route][:locations].last[:adminArea5]
    else
      arrival_weather = {temp: '', weather: [{description: ''}]}
      duration = 'Impossible'
      start = ''
      final = ''
    end
    {
      'attributes': {
        'start_city': start,
        'end_city': final,
        'travel_time': duration,
        'weather_at_eta': {
          'temperature': arrival_weather[:temp],
          'conditions': arrival_weather[:weather].first[:description]
        }
      }
    }
  end
end
