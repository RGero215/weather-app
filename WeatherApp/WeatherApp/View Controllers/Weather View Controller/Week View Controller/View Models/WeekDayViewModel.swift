//
//  WeekDayViewModel.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/2/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import UIKit

struct WeekDayViewModel {
    let weatherData: ForcastWeatherConditions
    
    private let dateFormatter = DateFormatter()
    
    var day: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: weatherData.time)
    }
    
    var date: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "MMMM d"
        
        return dateFormatter.string(from: weatherData.time)
    }
    
    var temperature: String {
        let min = String(format: "%.1f °F", weatherData.temperatureMin)
        let max = String(format: "%.1f °F", weatherData.temperatureMax)
        
        return "\(min) - \(max)"
    }

    
    
    var windSpeed: String {
        return String(format: "%.f MPH", weatherData.windSpeed)
    }
    
    var image: UIImage? {
        return UIImage.imageForIcon(with: weatherData.icon)
    }
}
