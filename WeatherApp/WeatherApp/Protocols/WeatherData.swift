//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/1/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import Foundation

protocol WeatherData {
    var latitude: Double {get}
    var longitude: Double {get}
    
    var current: CurrentWeatherConditions {get}
    var forecast: [ForcastWeatherConditions] {get}
}

protocol WeatherConditions {
    var time: Date {get}
    var icon: String {get}
    var windSpeed: Double {get}
}

protocol CurrentWeatherConditions: WeatherConditions {
    var summary: String {get}
    var temperature: Double {get}
}

protocol ForcastWeatherConditions: WeatherConditions {
    var temperatureMin: Double {get}
    var temperatureMax: Double {get}
}
