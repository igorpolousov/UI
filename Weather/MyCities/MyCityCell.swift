//
//  MyCityCell.swift
//  Weather
//
//  Created by Igor Polousov on 11.03.2021.
//

import UIKit

class MyCityCell: UITableViewCell {
    
    @IBOutlet weak var myCity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
