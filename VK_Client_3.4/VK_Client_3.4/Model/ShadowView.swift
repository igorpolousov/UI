//
//  ShadowView.swift
//  VK_Client_3.4
//
//  Created by Igor Polousov on 21.03.2021.
//

import UIKit

 @IBDesignable class ShadowView: UIView {
    
    @IBInspectable var shadowOpacity: CGFloat = 0.8 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable var shadowColor: CGColor = UIColor.darkGray.cgColor {
        didSet {
            layer.shadowColor = shadowColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 10.0 {
       didSet {
           layer.cornerRadius = cornerRadius
       }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 5.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
 }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 5, height: 5){
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
 }

extension ShadowView {
    func applyDesignShadow(){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}
 
