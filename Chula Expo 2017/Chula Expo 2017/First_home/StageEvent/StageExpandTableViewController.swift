//
//  StageExpandTableViewController.swift
//  Chula Expo 2017
//
//  Created by NOT on 2/1/2560 BE.
//  Copyright © 2560 Chula Computer Engineering Batch#41. All rights reserved.
//

import UIKit
import CoreData

class StageExpandTableViewController: StageExpandableCoreDataTableViewController {
    
    
    @IBOutlet weak var topTab: UIView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!

    var dateForDefault: Int = 1
    let dateComp = NSDateComponents()
    let nowDate = Date()
    var selectionIndicatorView: UIView = UIView()
    
    var selectedDate: Int = 1{
        didSet{
            selectSection = nil
            switch selectedDate {
            case 1:
                startDate = Date.day1
                endDate = Date.day2
            case 2:
                startDate = Date.day2
                endDate = Date.day3
            case 3:
                startDate = Date.day3
                endDate = Date.day4
            case 4:
                startDate = Date.day4
                endDate = Date.day5
            case 5:
                startDate = Date.day5
                endDate = Date.day6
            default:
                startDate = Date.day1
                endDate = Date.day2
            }
            updateUI()
            tableView.reloadData()
//            tableView.beginUpdates()
//            tableView.endUpdates()
        }
    }
    
    var startDate = Date.day1
    var endDate = Date.day2
    
    var stageNo: Int? {
        
        didSet {
            
//            updateUI()
        }
    }
    var managedObjectContext: NSManagedObjectContext? {
        
        didSet {
            
            updateUI()
        }
    }
    
    var selectSection: Int?{
        
        willSet{
            if selectSection != nil{
                let indexPath = IndexPath(row: 0, section: selectSection!)
                if let selectCell = tableView.cellForRow(at: indexPath) as? StageExpandableCell{
                    
                    selectCell.closeTitle()
                    
                }
            }
        }
        didSet{
            if selectSection != nil{
                let indexPath = IndexPath(row: 0, section: selectSection!)
                if let selectCell = tableView.cellForRow(at: indexPath) as? StageExpandableCell{
                    
                    selectCell.expandTitle()
                    
                }
            }
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
        
    }
    
    func setupTopTab(){
        
        moveToptabIndicator()
        let shadowPath = UIBezierPath(rect: topTab.bounds)
        topTab.layer.shadowColor = UIColor.darkGray.cgColor
        topTab.layer.shadowOffset = CGSize(width: 0, height: 0)
        topTab.layer.shadowRadius = 1
        topTab.layer.shadowOpacity = 0.5
        topTab.layer.shadowPath = shadowPath.cgPath
        updateButton(no: selectedDate, toBlack: false)
        
    }
    
    @IBAction func selectDate(_ sender: Any) {
        
        if let button = sender as? UIButton{
            updateButton(no: selectedDate, toBlack: true)
            selectedDate = button.tag
            updateButton(no: selectedDate, toBlack: false)
        }
        moveToptabIndicator()
    }
    
    func changeButtonAttributeColor(_ color: UIColor,for button: UIButton){
        
        let attribute = NSMutableAttributedString(attributedString: button.currentAttributedTitle!)
        attribute.addAttribute(NSForegroundColorAttributeName , value: color, range: NSRange(location: 0,length: 6))
        button.setAttributedTitle(attribute, for: .normal)
        button.setAttributedTitle(attribute, for: .highlighted)
    }

    func moveToptabIndicator(){
        
        UIView.animate(withDuration: 0.15, animations: { () -> Void in
            let sectionWidth = self.topTab.frame.width / 5
            let sectionX = (sectionWidth * (CGFloat)(self.selectedDate - 1) ) + 2
            self.selectionIndicatorView.frame = CGRect(x: sectionX, y: self.topTab.bounds.height-2, width: sectionWidth-4, height: 2)
        })
    }
    
    func updateButton(no: Int,toBlack: Bool){
        
        var color: UIColor
        var button: UIButton
        if toBlack{
            color = UIColor.black
        } else {
            color = UIColor(red:1.00, green:0.43, blue:0.60, alpha:1.0)
        }
        switch no {
        case 1:
            button = button1
        case 2:
            button = button2
        case 3:
            button = button3
        case 4:
            button = button4
        case 5:
            button = button5
        default:
            button = button1
        }
        changeButtonAttributeColor(color, for: button)
    }
    
    fileprivate func updateUI(){
        
        if let context = managedObjectContext{
            if let stageNo = stageNo{
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StageActivity")
                
                request.predicate = NSPredicate(format: "toActivity.end >= %@ AND toActivity.start <= %@ AND stage == %i", startDate as NSDate, endDate as NSDate, stageNo)
                
                request.sortDescriptors = [NSSortDescriptor(
                    key: "toActivity.start",
                    ascending: true,
                    selector: #selector(NSDate.compare(_:))
                    )]
                fetchedResultsController = NSFetchedResultsController(
                    fetchRequest: request,
                    managedObjectContext: context,
                    sectionNameKeyPath: "activityId",
                    cacheName: nil
                )
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(startDate.toThaiText()) - \(endDate.toThaiText())")
        selectedDate = dateForDefault
        self.navigationController?.navigationBar.isTranslucent = false
        var selectionIndicatorFrame : CGRect = CGRect()
        let sectionWidth = topTab.frame.width / 5
        selectionIndicatorFrame = CGRect(x: (sectionWidth * (CGFloat)(selectedDate - 1) ) + 2 , y: topTab.bounds.height-2, width: sectionWidth - 4, height: 2)
        selectionIndicatorView = UIView(frame: selectionIndicatorFrame)
        selectionIndicatorView.backgroundColor = UIColor(red:1.00, green:0.43, blue:0.60, alpha:1.0)
        setupTopTab()
        topTab.addSubview(selectionIndicatorView)
        tableView.estimatedRowHeight = 140
        tableView.reloadData()
//        tableView.contentInset = UIEdgeInsetsMake(((self.navigationController?.navigationBar.frame)?.height)! + (self.navigationController?.navigationBar.frame)!.origin.y, 0.0,  ((self.tabBarController?.tabBar.frame)?.height)!, 0);
        // Uncomment the following line to preserve selection between presentations
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
//        self.tableView.backgroundColor = UIColor.blue
        print("loadedStage")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("layoutStage")
        setupTopTab()
    }

    
        // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if indexPath.row == 0{
            
            cell = tableView.dequeueReusableCell(withIdentifier: "StageEventCell", for: indexPath)
            if let fetchData = fetchedResultsController?.object(at: IndexPath(row: 0, section: indexPath.section)) as? StageActivity{
                    
                var name: String?
                var startTime: String?
                var endTime: String?
                var dotOption: Int = 0
                
                fetchData.managedObjectContext?.performAndWait {
                    
                    name = fetchData.toActivity?.name
                    if let sTime = fetchData.toActivity?.start{
                        print("sTime  \(sTime.toThaiText())")
                        startTime = sTime.toTimeText()
                        
                        if let eTime = fetchData.toActivity?.end{
                            print("eTime  \(eTime.toThaiText())")
                            endTime = eTime.toTimeText()
                            if self.nowDate.isInRangeOf(start: sTime, end: eTime){
                                dotOption = 1
                            }
                            else if self.nowDate.isLessThanDate(sTime){
                                dotOption = 2
                            }
                            else if self.nowDate.isGreaterThanDate(eTime){
                                dotOption = 0
                            }
                            
                        }
                    }
                    
                    
                    
                }

                if let stageExpandableCell = cell as? StageExpandableCell{
                    if indexPath.section == selectSection{
                        stageExpandableCell.expandTitle()
                    } else {
                        stageExpandableCell.closeTitle()
                    }
                    stageExpandableCell.name = name
                    stageExpandableCell.time = startTime
                    stageExpandableCell.endTime = ("-\(endTime ?? "")")
                    
                    switch dotOption {
                    case 0:
                        stageExpandableCell.runningDot.image = #imageLiteral(resourceName: "passedDot")
                    case 1:
                        stageExpandableCell.runningDot.image = #imageLiteral(resourceName: "runningDot")
                    case 2:
                        stageExpandableCell.runningDot.image = #imageLiteral(resourceName: "nextComingDot")
                    default:
                        stageExpandableCell.runningDot.image = #imageLiteral(resourceName: "passedDot")
                    }
                }
            }
        }
        
        else{
                
            cell = tableView.dequeueReusableCell(withIdentifier: "stageDetail", for: indexPath)
            
            if let fetchData = fetchedResultsController?.object(at: IndexPath(row: 0, section: indexPath.section)) as? StageActivity{
                
                var desc: String?
                var id: String?
                fetchData.managedObjectContext?.performAndWait {
                    
                    desc = fetchData.toActivity?.desc
                    id = fetchData.toActivity?.activityId
                    
                }
                
                if let stageDetailCell = cell as? StageDetailCell{
                    
                    stageDetailCell.desc = desc
                    stageDetailCell.button.actID = id
                    
                }
            }
        }
        

        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectSection == indexPath.section && indexPath.row == 0 {
            
            selectSection = nil
            
        }
        else {
    
            selectSection = indexPath.section
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
       if indexPath.section == selectSection {
        
        if indexPath.row == 0{
            
//            if UITableViewAutomaticDimension < 0{
//                
//                return 50
//            }
            return UITableViewAutomaticDimension
            
        }else{
            
            return UITableViewAutomaticDimension
        }
        
       }
       else if indexPath.row == 0 {
            return UITableViewAutomaticDimension
        
        }
        return 0;
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailFromStage"{
            if let destination = segue.destination as? EventDetailTableViewController {
                
                if let button = sender as? DetailButton{
                    
                    if let id = button.actID{
                        
                        ActivityData.fetchActivityData(activityId: id, inManageobjectcontext: managedObjectContext!, completion: { (activityData) in
                            
                            if let activityData = activityData {
                                
                                destination.activityId = activityData.activityId
                                destination.bannerUrl = activityData.bannerUrl
                                destination.topic = activityData.name
                                destination.locationDesc = ""
                                destination.toRounds = activityData.toRound
                                destination.desc = activityData.desc
                                destination.room = activityData.room
                                destination.place = activityData.place
                                destination.zoneId = activityData.faculty
                                destination.latitude = activityData.latitude
                                destination.longitude = activityData.longitude
                                destination.pdf = activityData.pdf
                                destination.video = activityData.video
                                destination.toImages = activityData.toImages
                                destination.toTags = activityData.toTags
                                destination.start = activityData.start
                                destination.end = activityData.end
                                destination.managedObjectContext = self.managedObjectContext
                                
                            }
                            
                        })
                        
                    }
                }

            }
            
        }
        
    }
    
 }
