//
//  WeatherViewController.swift
//  Weather
//
//  Created by Karthik Muppala on 11/12/16.
//  Copyright © 2016 Karthik Muppala. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
    }
    
    
    //Mark: TableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        return cell
    }
    

    
    
    
    

}

