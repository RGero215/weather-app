//
//  WeekViewController.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/1/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import UIKit

final class WeekViewController: UIViewController {
    
    var viewModel: WeekViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(with: viewModel)
        }
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        setupView()
    }
    
    func setupView(){
        // Configure View
        view.backgroundColor = .red
    }
    
    private func setupViewModel(with viewModel: WeekViewModel) {
        print(viewModel)
    }
}
