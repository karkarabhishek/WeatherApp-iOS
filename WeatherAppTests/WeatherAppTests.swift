//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by abhishek.karkar on 05/04/23.
//

import XCTest
@testable import WeatherApp

final class WeatherAppTests: XCTestCase {
    
    var weatherViewModel: HomeViewModel!
      
      override func setUp() {
          super.setUp()
          let weatherService = HomeViewModel()
          weatherViewModel = HomeViewModel(weatherService: weatherService)
      }
      
      override func tearDown() {
          weatherViewModel = nil
          super.tearDown()
      }
      
      func testGetWeatherForValidCity() {
          // Arrange
          let expectation = self.expectation(description: "Get weather data for valid city")
          let city = "New York"
          
          // Act
          weatherViewModel.getWeatherForCity(city: city)
          
          // Assert
          DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
              XCTAssertNotNil(self.weatherViewModel.weatherData)
              XCTAssertEqual(self.weatherViewModel.locality, city)
              XCTAssertNotNil(self.weatherViewModel.weatherData?.coord?.lat)
              XCTAssertNotNil(self.weatherViewModel.weatherData?.coord?.lon)
              expectation.fulfill()
          }
          waitForExpectations(timeout: 10, handler: nil)
      }
      
      func testGetWeatherForInvalidCity() {
          // Arrange
          let expectation = self.expectation(description: "Get weather data for invalid city")
          let city = "InvalidCity"
          
          // Act
          weatherViewModel.getWeatherForCity(city: city)
          
          // Assert
          DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
              XCTAssertNil(self.weatherViewModel.weatherData)
              XCTAssertEqual(self.weatherViewModel.locality, city)
              XCTAssertNil(self.weatherViewModel.weatherData?.coord?.lat)
              XCTAssertNil(self.weatherViewModel.weatherData?.coord?.lon)
              expectation.fulfill()
          }
          waitForExpectations(timeout: 10, handler: nil)
      }

    func testStoreSearchCityToDefaults() {
            // Arrange
            let defaults = UserDefaults.standard
            let city = "New York"
            let lat = 40.7128
            let long = -74.0060
            
            // Act
            storeSearchCityToDefaults(city: city, lat: lat, long: long)
            
            // Assert
            XCTAssertEqual(defaults.string(forKey: Constants.Keys.city), city)
            XCTAssertEqual(defaults.double(forKey: Constants.Keys.lat), lat)
            XCTAssertEqual(defaults.double(forKey: Constants.Keys.long), long)
        }
        
        func testStoreSearchCityToDefaultsWithInvalidValues() {
            // Arrange
            let defaults = UserDefaults.standard
            let city: String? = nil
            let lat = -200.0
            let long = 500.0
            
            // Act
            storeSearchCityToDefaults(city: city, lat: lat, long: long)
            
            // Assert
            XCTAssertNil(defaults.string(forKey: Constants.Keys.city))
            XCTAssertNotEqual(defaults.double(forKey: Constants.Keys.lat), lat)
            XCTAssertNotEqual(defaults.double(forKey: Constants.Keys.long), long)
        }

}
