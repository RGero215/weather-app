//
//  Configuration.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/1/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import Foundation
import CoreLocation

enum Defaults {
    static let location = CLLocation(latitude: 37.928524, longitude: -122.349221)
}

enum WeatherService {
    private static let apiKey = "953aca515615d387c1ffd9ba793953fb"
    private static let baseUrl = URL(string: "https://api.darksky.net/forecast/")!
    
    static var authenticatedBaseUrl: URL {
        return baseUrl.appendingPathComponent(apiKey)
    }
}
