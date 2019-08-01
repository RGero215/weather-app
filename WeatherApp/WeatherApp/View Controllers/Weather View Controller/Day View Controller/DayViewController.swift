//
//  DayViewController.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/1/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import UIKit

final class DayViewController: UIViewController {
    
    var viewModel: DayViewModel? {
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
    
    private func setupView(){
        // Configure View
        view.backgroundColor = .green
    }
    
    private func setupViewModel(with viewModel: DayViewModel) {
        print(viewModel)
    }
    
}
