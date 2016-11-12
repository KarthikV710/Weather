//
//  WeatherCell.swift
//  Weather
//
//  Created by Karthik Muppala on 11/12/16.
//  Copyright © 2016 Karthik Muppala. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var day: UILabel!
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        weatherType.text = forecast.weatherType
        day.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
}
