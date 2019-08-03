//
//  WeekDayTableViewCell.swift
//  WeatherApp
//
//  Created by Ramon Geronimo on 8/2/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import UIKit

class WeekDayTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    // MARK: - Properties
    
    @IBOutlet var dayLabel: UILabel! {
        didSet {
            dayLabel.textColor = UIColor.WeatherApp.baseTextColor
            dayLabel.font = UIFont.WeatherApp.heavyLarge
        }
    }
    
    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.textColor = .black
            dateLabel.font = UIFont.WeatherApp.lightRegular
        }
    }
    
    @IBOutlet var windSpeedLabel: UILabel! {
        didSet {
            windSpeedLabel.textColor = .black
            windSpeedLabel.font = UIFont.WeatherApp.lightSmall
        }
    }
    
    @IBOutlet var temperatureLabel: UILabel! {
        didSet {
            temperatureLabel.textColor = .black
            temperatureLabel.font = UIFont.WeatherApp.lightSmall
        }
    }
    
    @IBOutlet var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
            iconImageView.tintColor = UIColor.WeatherApp.baseTintColor
        }
    }
    
    // MARK: - Initialization

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Public API
    
    func configure(with viewModel: WeekDayViewModel) {
        dayLabel.text = viewModel.day
        dateLabel.text = viewModel.date
        iconImageView.image = viewModel.image
        windSpeedLabel.text = viewModel.windSpeed
        temperatureLabel.text = viewModel.temperature
    }

}
