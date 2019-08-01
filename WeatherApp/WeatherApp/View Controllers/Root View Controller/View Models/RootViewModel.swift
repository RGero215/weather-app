//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/1/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import Foundation

class RootViewModel {
    
    enum WeatherDataError: Error {
        case noWeatherDataAvailable
    }
    
    typealias DidfetchWeatherDataCompletion = (DarkSkyResponse?, WeatherDataError?) -> Void
    
    var didFetchWeatherData: DidfetchWeatherDataCompletion?
    
    init() {
        fetchWeatherData()
    }
    
    // MARK: -
    
    private func fetchWeatherData() {
        //Create URL
        let weatherRequest = WeatherRequest(baseUrl: WeatherService.authenticatedBaseUrl, location: Defaults.location)
        
        // Create Data Task
        URLSession.shared.dataTask(with: weatherRequest.url) { [weak self] (data, response, error) in
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            if let error = error {
                print("Unable to Fetch Weather Data \(error)")
                
                self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let darkSkyResponse = try decoder.decode(DarkSkyResponse.self, from: data)
                    self?.didFetchWeatherData?(darkSkyResponse, nil)
                } catch {
                    print("Unable to Decode JSON Response \(error)")
                    self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                }
            } else {
                self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
            }
            }.resume()
    }
}
