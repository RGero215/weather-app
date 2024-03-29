//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/1/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import Foundation

class RootViewModel {
    
//    var mood =
    // MARK: - Types
    
    enum WeatherDataError: Error {
        case noWeatherDataAvailable
    }
    
    // MARK: - Type Aliases
    
    typealias DidfetchWeatherDataCompletion = (WeatherData?, WeatherDataError?) -> Void
    
    var didFetchWeatherData: DidfetchWeatherDataCompletion?
    
    // MARK: - Initialization
    
    init() {
        // Fectch Weather Data
        fetchWeatherData()
    }
    
    // MARK: - Helper Methods
    
    private func fetchWeatherData() {
        //Create URL
        let weatherRequest = WeatherRequest(baseUrl: WeatherService.authenticatedBaseUrl, location: Defaults.location)
        
        // Create Data Task
        URLSession.shared.dataTask(with: weatherRequest.url) { [weak self] (data, response, error) in
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            DispatchQueue.main.async {
                if let error = error {
                    print("Unable to Fetch Weather Data \(error)")
                    
                    self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                } else if let data = data {
                    // Initialize JSON Decoder
                    let decoder = JSONDecoder()
                    
                    // Set date decoder strategy
                    decoder.dateDecodingStrategy = .secondsSince1970
                    
                    do {
                        // Decode JSON Response
                        let darkSkyResponse = try decoder.decode(DarkSkyResponse.self, from: data)
                        // Invoke Completion Handler
                        self?.didFetchWeatherData?(darkSkyResponse, nil)
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "mood"), object: nil)
                    } catch {
                        print("Unable to Decode JSON Response \(error)")
                        // Invoke Completion Handler
                        self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                    }
                } else {
                    self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                }
            }
            
        }.resume()
    }
}
