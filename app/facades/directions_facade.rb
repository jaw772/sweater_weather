class DirectionsFacade
  def self.directions(start_city, end_city)
    RoadTripService.get_directions(start_city, end_city)
  end
end
