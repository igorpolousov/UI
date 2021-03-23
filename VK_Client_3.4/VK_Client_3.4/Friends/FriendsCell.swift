//
//  FriendsCell.swift
//  VK_Client_3.4
//
//  Created by Igor Polousov on 21.03.2021.
//

import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var friendImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        friendImage.applyDesign()
        shadowView.applyDesignShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


