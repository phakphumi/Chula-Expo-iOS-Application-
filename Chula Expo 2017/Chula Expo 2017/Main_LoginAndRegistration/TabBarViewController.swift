//
//  TabBarViewController.swift
//  Chula Expo 2017
//
//  Created by Pakpoom on 3/4/2560 BE.
//  Copyright © 2560 Chula Computer Engineering Batch#41. All rights reserved.
//

import UIKit
import CoreData

class TabBarViewController: UITabBarController {

    
    var managedObjectContext: NSManagedObjectContext? =
        (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editTag" {
            
            if let destination = segue.destination as? interestViewController {
                
                if let userData = UserData.fetchUser(inManageobjectcontext: self.managedObjectContext!) {
                    
                    destination.toEdit = true
                    destination.userToken = userData.token
                    
                }
                
                
            }
            
        } else if segue.identifier == "editInfo" {
            
            if let destination = segue.destination as? RegisterViewController {
                
                if let userData = UserData.fetchUser(inManageobjectcontext: self.managedObjectContext!) {
                    
                    destination.toEdit = true
                    destination.userType = userData.type
                    destination.userData = userData
                    destination.managedObjectContext = self.managedObjectContext

                    
                }
                
            }
            
        } else if segue.identifier == "toEventDetail" {
            
            if let destination = segue.destination as? EventDetailTableViewController {
                
                destination.activityId = SecondViewController.showingMyActivity.activityId
                destination.bannerUrl = SecondViewController.showingMyActivity.bannerUrl
                destination.topic = SecondViewController.showingMyActivity.name
                destination.locationDesc = ""
                destination.toRounds = SecondViewController.showingMyActivity.toRound
                destination.desc = SecondViewController.showingMyActivity.desc
                destination.room = SecondViewController.showingMyActivity.room
                destination.place = SecondViewController.showingMyActivity.place
                destination.zoneId = SecondViewController.showingMyActivity.faculty
                destination.latitude = SecondViewController.showingMyActivity.latitude
                destination.longitude = SecondViewController.showingMyActivity.longitude
                destination.pdf = SecondViewController.showingMyActivity.pdf
                destination.toImages = SecondViewController.showingMyActivity.toImages
                destination.toTags = SecondViewController.showingMyActivity.toTags
                destination.managedObjectContext = self.managedObjectContext
                
            }
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
