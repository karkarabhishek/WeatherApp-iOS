
# Weather App

This repository contains a simple weather app built in Swift using MVVM architecture. The app fetches weather data from OpenWeatherMap API and uses Google Places API for autocomplete search functionality.

## Features
- View weather data for a searched city
- Search for a city with autocomplete suggestions
- Store recent search history

## Requirements
- Xcode 13+
- Swift 5+
- iOS 14+

## Setup
1. Clone the repository:

```
git clone https://github.com/karkarabhishek/WeatherApp-iOS.git
```
2. Open the Xcode project file:
```
cd WeatherApp-iOS-main
open WeatherApp.xcodeproj
```
3. Run the app in the Xcode simulator or on a physical device.
Note: You will need to provide your own API keys for OpenWeatherMap and Google Places API. You can do this by adding a Keys.plist file in the root directory of the project and adding the following keys with their respective values:

- OpenWeatherMapAPIKey: Your OpenWeatherMap API key
- GooglePlacesAPIKey: Your Google Places API key



## Architecture

The app uses the MVVM architecture pattern:

- Model: Encapsulates the app's data and business logic.
- View: Displays the UI and captures user input.
- ViewModel: Mediates between the Model and View layers, transforming model data into a format suitable for display in the UI.
## Credits

- OpenWeatherMap API: https://openweathermap.org/api
- Google Places API: https://developers.google.com/maps/documentation/places/web-service/overview


## License

The app is released under the MIT License. See LICENSE for more information.
