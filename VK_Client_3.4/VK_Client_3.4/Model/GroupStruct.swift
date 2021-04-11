//
//  GroupStruct.swift
//  VK_Client_3.4
//
//  Created by Igor Polousov on 21.03.2021.
//

import Foundation
import UIKit

struct AllGroups {
    var name: String
    var photo: UIImage
}

extension AllGroups: Equatable {
    static func == (lhs: AllGroups, rhs: AllGroups) -> Bool{
        return lhs.name == rhs.name &&
            lhs.photo == rhs.photo
    }
}


