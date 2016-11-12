//
//  WeatherViewController.swift
//  Weather
//
//  Created by Karthik Muppala on 11/12/16.
//  Copyright © 2016 Karthik Muppala. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentWeather : CurrentWeather!
    var forecast : Forecast!
    
    var arrayOfForecasts = [Forecast]()
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentWeatherType: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        //setup tableview
        let forecastURL = URL(string: forecastUrlString)!
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            print(response)
            if let dict = result.value as? Dictionary<String, Any>{
                self.parseDict(dict: dict)
            }
            self.tableView.reloadData()
            completed()
        }
    }
    
    func parseDict(dict: Dictionary<String, Any>) {
        if let list = dict["list"] as? [Dictionary<String, Any>]{
            for listItem in list {
                let forecast = Forecast(weatherDict:listItem)
                self.arrayOfForecasts.append(forecast)
            }
            //Removing object at index 0, as that will be current weather forecast which is already handled
            self.arrayOfForecasts.remove(at: 0)
        }
    }
    
    //Mark: TableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfForecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell{
            let forecast = arrayOfForecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }else{
            return WeatherCell()
        }
        
        
    }
    
    func updateMainUI(){
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherType.text = currentWeather.weatherType
        currentLocation.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    

    
    
    
    

}

