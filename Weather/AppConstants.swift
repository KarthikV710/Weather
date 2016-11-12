//
//  AppConstants.swift
//  Weather
//
//  Created by Karthik Muppala on 11/12/16.
//  Copyright © 2016 Karthik Muppala. All rights reserved.
//

import Foundation

let baseURL: String = "http://api.openweathermap.org/data/2.5/weather?"
let latitude: String = "lat="
let longitude: String = "&lon="
let appId: String = "&appid="
let apiKey: String = "48162e0f719b341a81909379d3a46f22"

typealias DownloadComplete = () -> ()

let currentWeatherURL: String = "\(baseURL)\(latitude)-36\(longitude)123\(appId)\(apiKey)"

