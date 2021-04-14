//
//  AllGroupsCell.swift
//  VK_Client_3.4
//
//  Created by Igor Polousov on 21.03.2021.
//

import UIKit

class AllGroupsCell: UITableViewCell {
    
    @IBOutlet weak var allGroupName: UILabel!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var groupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.applyDesignShadow()
        groupImage.applyDesign()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
