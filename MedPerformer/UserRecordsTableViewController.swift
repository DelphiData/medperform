//
//  UserRecordsTableViewController.swift
//  MedPerformer
//
//  Created by Lonnie Bargo on 3/8/15.
//  Copyright (c) 2015 Lonnie J. Bargo. All rights reserved.
//

import UIKit; import Parse

class UserRecordsTableViewController: PFQueryTableViewController {
    
    // Initialise the PFQueryTable tableview
    override init!(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Event"
        self.textKey = "category"
        self.title = "createdAt"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery! {
        var query = PFQuery(className: "event")
        query.orderByAscending("createdAt")
        query.whereKey("user", equalTo: PFUser.currentUser())
        
        
        
        
        return query
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject) -> PFTableViewCell {
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UserRecordsTableViewCell!
        
        if cell == nil {
            cell = UserRecordsTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
    
    var dateUpdated = object.createdAt as NSDate
    var dateFormat = NSDateFormatter()
    dateFormat.dateFormat = "EEE, MMM d, h:mm a"
    
    cell.catDate.text = NSString(format: "%@", dateFormat.stringFromDate(dateUpdated))
    cell.catTitle.text = object["category"] as String!
     
        
      
        
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as DetailUserRecordsViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = objects[row] as? PFObject
        }
    }
}