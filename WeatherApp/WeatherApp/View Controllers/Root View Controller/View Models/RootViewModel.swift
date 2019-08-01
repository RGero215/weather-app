//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/1/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import Foundation

class RootViewModel {
    
    typealias DidfetchWeatherDataCompletion = (Data?, Error?) -> Void
    
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
            if let error = error {
                self?.didFetchWeatherData?(nil, error)
            } else if let data = data {
                self?.didFetchWeatherData?(data, nil)
            } else {
                self?.didFetchWeatherData?(nil, nil)
            }
            }.resume()
    }
}
