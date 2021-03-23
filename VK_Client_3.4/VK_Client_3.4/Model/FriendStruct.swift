//
//  FriendStruct.swift
//  VK_Client_3.4
//
//  Created by Igor Polousov on 21.03.2021.
//

import Foundation
import UIKit

struct friend {
    var name: String
    var photo: UIImage
    var pictures: UIImage
}

var friends = [
    friend(name: "Denis Kuchaev", photo: UIImage.init(imageLiteralResourceName: "KuchaevAV"),pictures: UIImage.init(imageLiteralResourceName: "Kuchaev1")),
    friend(name: "Ustimov Denis", photo: UIImage.init(imageLiteralResourceName: "UstimovAv"), pictures: UIImage.init(imageLiteralResourceName: "Ustimov1")),
    friend(name: "Kseniya Mihailichenko", photo: UIImage.init(imageLiteralResourceName: "Mihailichenko"), pictures: UIImage.init(imageLiteralResourceName: "Mihailichenko1"))
]
