# Sweater Weather

This project is the final project for module 3 for the Turing School of Software & Design. The objective for this project is to consume 3rd party APIs and expose new APIs based on an incoming set of requirements set up by a front-end engineer.

Sweater Weather's purpose is to be able to take in a location and return a current forecast, five day forecast and the forecast for the next 8 hours. It also allows for someone to create a background for a user based on a given location. Additionally it allows for a user to be able to check a travel route. This check will return the duration of the trip based on a car traveling at posted speeds as well as give the weather information when they should arrive there.

## Incoming Front-End Requests


<img width="704" alt="Screen Shot 2022-03-08 at 11 39 57 PM" src="https://user-images.githubusercontent.com/87674632/157386404-93dd1509-52c4-4e04-9272-28f37a31fa7a.png">

<img width="1244" alt="Screen Shot 2022-03-08 at 11 40 27 PM" src="https://user-images.githubusercontent.com/87674632/157386466-1e04bbc6-95a5-44c3-a140-050618b6559c.png">

<img width="1099" alt="Screen Shot 2022-03-08 at 11 41 03 PM" src="https://user-images.githubusercontent.com/87674632/157386531-c66bd511-a5b1-4799-b585-bedc3f59de3c.png">

<img width="940" alt="Screen Shot 2022-03-08 at 11 41 27 PM" src="https://user-images.githubusercontent.com/87674632/157386581-541fb6de-fe82-4bcb-bda0-4a6ad27ca820.png">

## Paths 
- Retrieve a background image: GET api/v1/backgrounds?location={query}
- Retrieve the weather: GET api/v1/forecast?location={query}
- Create a user: POST api/v1/users
- Login a user: POST api/v1/sessions
- Check a road trip: POST api/v1/road_trip

### API Keys
 - [OpenWeather API](https://openweathermap.org/api)
 - [Mapquest API](https://developer.mapquest.com/documentation/)
 - [Pexels API](https://www.pexels.com/api/)
 
### Skills Used
- API Consumption and Exposure via Facade/Service Design Pattern
- Ruby on Rails
- Sad Path/Edge Case Management

### Main Gems Used
- Faraday         - Pry
- Bcrypt          - Figaro
- RSpec           - jsonapi-serializer
- ShouldaMatchers - SimpleCov

## Local Setup for any other use

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create, migrate}`
4. Rails s


## Versions

- Ruby 2.7.2

- Rails 5.2.6

## <ins>Author Information</ins>
<p>
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</p>
[Josh Walsh](https://www.linkedin.com/in/jaw772/)

<p>
  <br>
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />
</p>
[Josh Walsh](https://github.com/jaw772)
