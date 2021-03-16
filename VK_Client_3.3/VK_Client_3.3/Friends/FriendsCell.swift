//
//  FriendsCell.swift
//  VK_Client_3.3
//
//  Created by Igor Polousov on 15.03.2021.
//

import UIKit

class FriendsCell: UITableViewCell {

    
    @IBOutlet weak var friendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
