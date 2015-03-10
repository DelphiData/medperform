//
//  UserRecordsTableViewController.swift
//  MedPerformer
//
//  Created by Lonnie Bargo on 3/8/15.
//  Copyright (c) 2015 Lonnie J. Bargo. All rights reserved.
//

import UIKit

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
        self.textKey = "duration"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery! {
        var query = PFQuery(className: "event")
        query.orderByAscending("category")
        
        
        return query
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UserRecordsTableViewCell!
        if cell == nil {
            cell = UserRecordsTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        
        cell.durationEventLabel.text = object["duration"] as? String
        
        
        // Date for cell subtitle
        /*var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateForText = object["createdAt"] as NSDate
        cell.dateEventLabel.text = dateFormatter.stringFromDate(dateForText)*/
        
        
        
        
        
        
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        /*var detailScene = segue.destinationViewController as YourDetailViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = objects[row] as? PFObject
        }*/
    }
    
    
    /*Make sure you have set the cells reuse identifier to match what you are setting it to in this code.*/

   
}