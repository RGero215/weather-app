//
//  Styles.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/2/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import UIKit

extension UIColor {
    enum WeatherApp {
        private static let base: UIColor = UIColor(red: 0.31, green: 0.72, blue: 0.83, alpha: 1.0)
        
        static var baseTextColor: UIColor {
            return base
        }
        
        static var baseBackgroundColor: UIColor {
            return base
        }
        
        static var baseTintColor: UIColor {
            return base
        }
        
        static let lightBackgroundColor: UIColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1.0)
    }
    
}

extension UIFont {
    enum WeatherApp {
        static let lightRegular: UIFont = .systemFont(ofSize: 17.0, weight: .light)
        static let lightSmall: UIFont = .systemFont(ofSize: 15.0, weight: .light)
        static let heavyLarge: UIFont = .systemFont(ofSize: 20.0, weight: .heavy)
    }
}
