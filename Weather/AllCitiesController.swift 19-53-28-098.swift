//
//  AllCitiesController.swift
//  Weather
//
//  Created by Igor Polousov on 11.03.2021.
//

import UIKit

class AllCitiesController: UITableViewController {
    
    var cities = [
        "Moscow",
        "Krasnoyarsk",
        "London",
        "Paris"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! AllCitiesCell
        // получаем город для конктретной строки
        let city = cities[indexPath.row]
        
        // устанавливаем город в надпись ячейки
        cell.cityName.text = city
        
        return cell
    }
}


