//
//  DarkSkyResponse.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/1/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import Foundation

struct DarkSkyResponse: Codable {
    
    struct Conditions: Codable {
        let time: Date
        let icon: String
        let summary: String
        let windSpeed: Double
        let temperature: Double
    }
    
    struct Daily: Codable {
        let data: [Conditions]
        
        struct Conditions: Codable {
            let time: Date
            let icon: String
            let windSpeed: Double
            let temperatureMin: Double
            let temperatureMax: Double
        }
    }
    
    let latitude: Double
    let longitude: Double
    
    let currently: Conditions
    let daily: Daily
}
