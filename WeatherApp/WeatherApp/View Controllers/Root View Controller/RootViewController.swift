//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/1/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {
    
    private enum AlertType {
        case noWeatherDataAvailable
    }
    
    // MARK: - Properties
    
    var viewModel: RootViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            setupViewModel(with: viewModel)
        }
    }
    
    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard.main.instantiateViewController(withIdentifier: DayViewController.storyboardIdentifier) as? DayViewController else {
            fatalError("Unable to Instantiate Day View Controller")
        }
        
        // Configure Day View Controller
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return dayViewController
    }()
    
    private let weekViewController: WeekViewController = {
        guard let weekViewController = UIStoryboard.main.instantiateViewController(withIdentifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
            fatalError("Unable to Instantiate Week View Controller")
        }
        
        // Configure Day View Controller
        weekViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return weekViewController
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Child View Controllers
        setupChildViewControllers()
        NotificationCenter.default.addObserver(self, selector: #selector(mood), name: Notification.Name(rawValue: "mood"), object: nil)
        
    }
    
    @objc func mood(){
        moodAlert(weather: dayViewController.descriptionLabel.text!)
    }
    
    // MARK: - Helper Methods
    
    private func setupChildViewControllers(){
        addChild(dayViewController)
        addChild(weekViewController)
        
        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)
        
        dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
        weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        dayViewController.didMove(toParent: self)
        weekViewController.didMove(toParent: self)
        
    }
    
    private func setupViewModel(with viewModel: RootViewModel) {
        viewModel.didFetchWeatherData = { [weak self] (weatherData, error) in
            if let _ = error {
                self?.presentAlert(of: .noWeatherDataAvailable)
            } else if let weatherData = weatherData {
                let dayViewModel = DayViewModel(weatherData: weatherData.current)
                
                self?.dayViewController.viewModel = dayViewModel
                
                let weekViewModel = WeekViewModel(weatherData: weatherData.forecast)
                
                self?.weekViewController.viewModel = weekViewModel
            } else {
                self?.presentAlert(of: .noWeatherDataAvailable)
            }
        }
    }
    
    private func presentAlert(of alertType: AlertType) {
        let title: String
        let message: String
        
        switch alertType {
        case .noWeatherDataAvailable:
            title = "Unable to Fetch Weather Data"
            message = "The application is unable to fetch weather data. Please make sure your device is connected over Wi-Fi or celular."
        }
        
        let alerteController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerteController.addAction(cancelAction)
        present(alerteController, animated: true)
    }
    
    func moodAlert(weather: String) {
        let title = "Today is \(weather)"
        let message = "How is the weather makes you feel today?"
        
        let alerteController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alerteController.addAction(UIAlertAction(title: "Happy", style: .default, handler: { action in
            self.dayViewController.moodLabel.text = self.self.stringToEmojis(word: "Happy")
        }))
        
        alerteController.addAction(UIAlertAction(title: "Not Happy", style: .default, handler: { action in
            self.dayViewController.moodLabel.text = self.stringToEmojis(word: "Not Happy")
        }))
        
        present(alerteController, animated: true)
    }
    
    func stringToEmojis(word: String) -> String {
        if word == "Happy" {
            return "😀"
        } else {
            return "😩"
        }
    }

}

