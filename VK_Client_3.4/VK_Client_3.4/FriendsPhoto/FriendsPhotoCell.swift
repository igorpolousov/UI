//
//  FriendsPhotoCell.swift
//  VK_Client_3.4
//
//  Created by Igor Polousov on 21.03.2021.
//

import UIKit

class FriendsPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBAction func likeButton(_ sender: Any) {
        heartOn = !heartOn
        updateHeart()
        
        heartCount.text = "\(tapCount)"
    }
    
    @IBOutlet weak var heartImage: UIImageView!
    
    @IBOutlet weak var heartCount: UILabel!
    
    override func awakeFromNib() {
        heartImage.tintColor = UIColor.systemBlue
        heartImage.image = UIImage.init(systemName: "heart")
        heartCount.textColor = UIColor.systemBlue
        heartCount.text = "0"
    }
    
    
    var heartOn = true
    var tapCount = 0
    
    func updateHeart(){
        if heartOn {
            heartImage.tintColor = UIColor.systemBlue
            heartImage.image = UIImage.init(systemName: "heart")
            heartCount.textColor = UIColor.systemBlue
            tapCount -= 1
            
        } else {
            heartImage.tintColor = UIColor.systemPink
            heartImage.image = UIImage.init(systemName: "heart.fill")
            heartCount.textColor = UIColor.systemPink
            tapCount += 1
            
        }
    }
}
