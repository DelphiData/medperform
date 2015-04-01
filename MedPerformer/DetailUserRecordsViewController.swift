//
//  DetailUserRecordsViewController.swift
//  MedPerformer
//
//  Created by Lonnie Bargo on 3/31/15.
//  Copyright (c) 2015 Lonnie J. Bargo. All rights reserved.
//

import UIKit
import Parse

class DetailUserRecordsViewController: UIViewController {
    
    // Container to store the view table selected object
    var currentObject : PFObject?
    
    
    @IBOutlet weak var eventTextAlter: UITextField!
    
    @IBOutlet weak var dateTextAlter: UITextField!
    
    @IBOutlet weak var durationTextAlter: UITextField!
    
    @IBOutlet weak var commentTextAlter: UITextField!
    
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Unwrap the current object object
        if let object = currentObject? {
            
            var dateUpdated = object.createdAt as NSDate
            var dateFormat = NSDateFormatter()
            dateFormat.dateFormat = "EEE, MMM d, h:mm a"
            
            var newDuration = object["duration"] as String
            
            eventTextAlter.text = object["category"] as String
            dateTextAlter.text = NSString(format: "%@", dateFormat.stringFromDate(dateUpdated))
            durationTextAlter.text = newDuration as String
            commentTextAlter.text = object["comments"] as String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
