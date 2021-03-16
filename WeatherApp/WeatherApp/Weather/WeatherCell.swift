//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Igor Polousov on 14.03.2021.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func prepareForReuse() {
        weather.text = ""
        time.text = ""
    }
    
}
