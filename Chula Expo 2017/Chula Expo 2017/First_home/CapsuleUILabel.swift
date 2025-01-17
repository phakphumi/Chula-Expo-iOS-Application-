//
//  CapsuleUILabel.swift
//  Chula Expo 2017
//
//  Created by NOT on 1/17/2560 BE.
//  Copyright © 2560 Chula Computer Engineering Batch#41. All rights reserved.
//

import UIKit

class CapsuleUILabel: UILabel {

    let topInset = CGFloat(0)
    let bottomInset = CGFloat(0)
    let leftInset = CGFloat(2.5)
    let rightInset = CGFloat(2.5)
    
    override func drawText(in rect: CGRect)
    {
        let insets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override public var intrinsicContentSize: CGSize
    {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
//    func makeRound() {
//        self.layer.cornerRadius = 2
//        self.clipsToBounds = true
//        self.layer.masksToBounds = false
//    }
    func setText(name: String){
        
        self.textColor = UIColor.white
        text = name
        switch name {
        
        case "SMART":
            backgroundColor = UIColor(red:0.96, green:0.54, blue:0.29, alpha:1.0)
            self.layer.borderWidth = 0
        case "HEALTH":
            backgroundColor = UIColor(red:0.44, green:0.76, blue:0.63, alpha:1.0)
            self.layer.borderWidth = 0
        case "HUMAN":
            backgroundColor = UIColor(red:0.22, green:0.15, blue:0.38, alpha:1.0)
            self.layer.borderWidth = 0
        case "ENG":
            backgroundColor = UIColor(red:0.50, green:0.00, blue:0.00, alpha:1.0)
            self.layer.borderWidth = 0
        case "ARTS":
            backgroundColor = UIColor(red:0.54, green:0.54, blue:0.54, alpha:1.0)
            self.layer.borderWidth = 0
        case "SCI":
            backgroundColor = UIColor(red:1.00, green:0.87, blue:0.00, alpha:1.0)
            self.textColor = UIColor.black
            self.layer.borderWidth = 0
        case "POLSCI":
            backgroundColor = UIColor.black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1.0
        case "ARCH":
            backgroundColor = UIColor(red:0.44, green:0.28, blue:0.20, alpha:1.0)
            self.layer.borderWidth = 0
        case "BANSHI":
            backgroundColor = UIColor(red:0.15, green:0.56, blue:0.67, alpha:1.0)
            self.layer.borderWidth = 0
        case "EDU":
            backgroundColor = UIColor(red:1.00, green:0.20, blue:0.00, alpha:1.0)
            self.layer.borderWidth = 0
        case "COMMARTS":
            backgroundColor = UIColor(red:0.17, green:0.17, blue:0.38, alpha:1.0)
            self.layer.borderWidth = 0
        case "ECON":
            backgroundColor = UIColor(red:0.69, green:0.58, blue:0.20, alpha:1.0)
            self.textColor = UIColor(red:0.36, green:0.29, blue:0.02, alpha:1.0)
            self.layer.borderWidth = 0
        case "MED":
            backgroundColor = UIColor(red:0.00, green:0.40, blue:0.00, alpha:1.0)
                self.layer.borderWidth = 0
        case "VET":
            backgroundColor = UIColor(red:0.27, green:0.73, blue:0.73, alpha:1.0)
            self.layer.borderWidth = 0
        case "DENT":
            backgroundColor = UIColor(red:0.30, green:0.22, blue:0.45, alpha:1.0)
            self.layer.borderWidth = 0
        case "PHARM":
            backgroundColor = UIColor(red:0.47, green:0.69, blue:0.16, alpha:1.0)
            self.layer.borderWidth = 0
        case "LAW":
            backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1.0
            self.textColor = UIColor.black
        case "FAA":
            backgroundColor = UIColor(red:0.76, green:0.31, blue:0.31, alpha:1.0)
            self.layer.borderWidth = 0
        case "FON":
            backgroundColor = UIColor(red:0.93, green:0.11, blue:0.14, alpha:1.0)
            self.layer.borderWidth = 0
        case "AHS":
            backgroundColor = UIColor(red:0.80, green:0.60, blue:1.00, alpha:1.0)
            self.textColor = UIColor(red:0.38, green:0.21, blue:0.54, alpha:1.0)
            self.layer.borderWidth = 0
        case "PSY":
            backgroundColor = UIColor(red:0.39, green:0.36, blue:0.73, alpha:1.0)
            self.layer.borderWidth = 0
        case "SPSC":
            backgroundColor = UIColor(red:1.00, green:0.40, blue:0.00, alpha:1.0)
            self.layer.borderWidth = 0
        case "SAR":
            backgroundColor = UIColor(red:0.53, green:0.25, blue:0.25, alpha:1.0)
            self.layer.borderWidth = 0
        case "GRAD":
            backgroundColor = UIColor(red:0.73, green:0.38, blue:0.50, alpha:1.0)
            self.layer.borderWidth = 0
        case "CUTALK":
            backgroundColor = UIColor(red:1.00, green:0.31, blue:0.62, alpha:1.0)
            self.layer.borderWidth = 0
        case "CU100":
            backgroundColor = UIColor(red:1.00, green:0.31, blue:0.62, alpha:1.0)
            self.layer.borderWidth = 0
        case "ARTGAL":
            backgroundColor = UIColor(red:1.00, green:0.31, blue:0.62, alpha:1.0)
            self.layer.borderWidth = 0
        case "FORUM":
            backgroundColor = UIColor(red:1.00, green:0.31, blue:0.62, alpha:1.0)
            self.layer.borderWidth = 0
        case "TRCN":
            backgroundColor = UIColor(red:0.86, green:0.08, blue:0.24, alpha:1.0)
            self.layer.borderWidth = 0
        case "PNC":
            backgroundColor = UIColor(red:0.60, green:0.00, blue:0.20, alpha:1.0)
            self.layer.borderWidth = 0
        case "RCU":
            backgroundColor = UIColor(red:0.93, green:0.02, blue:0.47, alpha:1.0)
            self.layer.borderWidth = 0
        case "HALL":
            self.text = "CUTALK"
            backgroundColor = UIColor(red:1.00, green:0.31, blue:0.62, alpha:1.0)
            self.layer.borderWidth = 0
        case "SALA":
            self.text = "CU100"
            backgroundColor = UIColor(red:1.00, green:0.31, blue:0.62, alpha:1.0)
            self.layer.borderWidth = 0
        case "ART":
            self.text = "ARTGAL"
            backgroundColor = UIColor(red:1.00, green:0.31, blue:0.62, alpha:1.0)
            self.layer.borderWidth = 0
        case "INTERFORUM":
            backgroundColor = UIColor(red:1.00, green:0.31, blue:0.62, alpha:1.0)
            self.layer.borderWidth = 0
        default:
            
            backgroundColor = UIColor.gray
            self.layer.borderWidth = 0

        }
        
        self.layer.cornerRadius = CGFloat(3)
        self.layer.masksToBounds = true

    }
}
