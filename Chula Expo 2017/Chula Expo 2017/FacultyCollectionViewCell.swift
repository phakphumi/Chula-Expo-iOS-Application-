//
//  FacultyCollectionViewCell.swift
//  Chula Expo 2017
//
//  Created by NOT on 2/7/2560 BE.
//  Copyright © 2560 Chula Computer Engineering Batch#41. All rights reserved.
//

import UIKit

class FacultyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var tagLabel: CapsuleUILabel!
    
    var bg: String?{
        didSet{
            if let bg = bg{
                
                if bg == ""{
                    bgImage.image = UIImage(named: "defaultImage")
                } else {
                    bgImage.image = UIImage(named: bg)
                }
            }
        }
    }
    var icon: String?{
        didSet{
            if let icon = icon{
                iconImage.image = UIImage(named: icon)
            }
        }
    }
    var name: String?{
        didSet{
            if let name = name{
                nameLabel.text = name
            }
        }
    }
    
    var sub: String?{
        didSet{
            if let sub = sub{
                subLabel.text = sub
            }
        }
    }
    
    var tagname: String?{
        didSet{
            if tagname != nil{
                tagLabel.setText(name: tagname!)
            }
            else{
                tagLabel.text = nil
            }
        }

    }
    
    var zoneId: String?
    
}
