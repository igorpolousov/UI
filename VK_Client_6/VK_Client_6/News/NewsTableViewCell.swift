//
//  NewsTableViewCell.swift
//  VK_Client_6
//
//  Created by Igor Polousov on 29.03.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
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
