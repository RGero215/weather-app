//
//  UIImage.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/2/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import UIKit

extension UIImage {
    class func imageForIcom(with name: String) -> UIImage? {
        switch name {
        case "clear-day",
             "clear-night",
             "fog",
             "rain",
             "snow",
             "sleet",
             "wind":
            return UIImage(named: name)
        case "cloudy",
             "partly-cloudy-day",
             "partly-cloudy-night":
            return UIImage(named: "cloudy")
        default:
            return UIImage(named: "clear-day")
        }
    }
}
