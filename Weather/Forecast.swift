//
//  Forecast.swift
//  Weather
//
//  Created by Karthik Muppala on 11/12/16.
//  Copyright © 2016 Karthik Muppala. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date:String{
        if _date == nil{
            return ""
        }
        return _date
    }
    var weatherType: String{
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var highTemp: String{
        if _highTemp == nil {
            return ""
        }
        return _highTemp
    }
    var lowTemp: String{
        if _lowTemp == nil {
            return ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, Any>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, Any>{
            if let min = temp["min"] as? Double{
                self._lowTemp = self.convertKelvinToFarenheit(temp: min)
            }
            if let max = temp["max"] as? Double{
                self._highTemp = self.convertKelvinToFarenheit(temp: max)
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String, Any>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970:date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
    func convertKelvinToFarenheit(temp: Double) -> String {
        let kelvinToFarentheitPreDivision = ((temp*9/5) -  459.67)
        let kelvinToFarentheit = Double(round(10*kelvinToFarentheitPreDivision/10))
        return "\(kelvinToFarentheit)"
    }
}

extension Date{
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}














