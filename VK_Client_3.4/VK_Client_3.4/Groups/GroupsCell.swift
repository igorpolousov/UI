//
//  GroupsCell.swift
//  VK_Client_3.4
//
//  Created by Igor Polousov on 21.03.2021.
//

import UIKit

class GroupsCell: UITableViewCell {
  
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var groupPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.applyDesignShadow()
        groupPhoto.applyDesign()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
