//
//  interestCollectionViewCell1.swift
//  Chula Expo 2017
//
//  Created by Ekkalak Leelasornchai on 1/29/2560 BE.
//  Copyright © 2560 Chula Computer Engineering Batch#41. All rights reserved.
//

import UIKit

class interestCollectionViewCell1: UICollectionViewCell {
    var imgName: [String?] = ["","",""]
        {
        didSet{
            updateUI()
        }
    }
    
    var tagName: [String?] = ["","",""]
        {
        didSet{
            updateUI()
        }
    }
    
    var tagBack: [String?] = ["","",""]
        {
        didSet{
            updateUI()
        }
    }
    var tagEngName: [String?] = ["","",""]
        {
        didSet{
            updateUI()
        }
    }
    @IBOutlet weak var interestView1: UIView!{
        didSet{
            roundedCornerBack1()
        }
    }

    @IBOutlet weak var interestName1: UILabel!
    @IBOutlet weak var backImg1: UIImageView!
    @IBOutlet weak var interestImg1: UIImageView!
    @IBOutlet weak var engName1: UILabel!
    override func layoutSubviews() {
        super.layoutSubviews()
        roundedCornerBack1()
        backImg1.isUserInteractionEnabled = true
        interestImg1.isUserInteractionEnabled = true
        
        /*let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(interestCollectionViewCell1.wasTapped(gestureRecognizer:)))
        tapGestureRecognizer1.numberOfTapsRequired = 1
        
        backImg1.addGestureRecognizer(tapGestureRecognizer1)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(interestCollectionViewCell1.wasTapped(gestureRecognizer:)))
        tapGestureRecognizer2.numberOfTapsRequired = 1
        
        interestImg1.addGestureRecognizer(tapGestureRecognizer2)
*/
        //interestName1.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
       func updateUI(){
        //Reset old data
        interestImg1.image = nil
        interestName1.text = nil
        backImg1.image = nil
        interestName1.isHidden = true
        
        
        engName1.text = nil
        engName1.isHidden = true
        
        //Set new data
        
        if let Iname1: String = imgName[0]
        {
            interestImg1.image = UIImage(named: Iname1)
        }
        
        if let Bname1: String = tagBack[0]
        {
            backImg1.image = UIImage(named: Bname1)
        }
        if let Tname1: String = tagName[0]
        {
            if(Tname1 != ""){interestName1.isHidden = false}
            interestName1.text = Tname1
        }
        if let Ename1: String = tagEngName[0]
        {
            if(Ename1 != ""){engName1.isHidden = false}
            engName1.text = Ename1
        }
    }
    
    
    
    func roundedCornerBack1()
    {
        interestView1.layer.cornerRadius = 3
        interestView1.layer.masksToBounds = true
        
    }
}
