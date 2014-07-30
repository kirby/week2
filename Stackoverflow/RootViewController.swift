//
//  TableViewController.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/30/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var questionTable: UITableView!
    
    var networkController = NetworkController()
    var questions : [Question]?
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.searchBar.delegate = self
        
        self.questionTable.rowHeight = UITableViewAutomaticDimension
        self.questionTable.delegate = self
        
        //networkController.fetchQuestionsForSearchTerm("Swift", callback: handleSearchResponse)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        println("searchBarSearchButtonClicked")
        search(searchBar.text)
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar!) {
        println("searchBarTextDidEndEditing")
        search(searchBar.text)
    }
    
    func search(searchTerm : String) {
        searchBar.resignFirstResponder()
        networkController.fetchQuestionsForSearchTerm(searchTerm, callback: handleSearchResponse)
    }

    func handleSearchResponse(questions : [Question]?, errorDescription : String?) {
        if errorDescription {
            println("\(errorDescription)")
            return
        }
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.questions = questions
            self.questionTable.reloadData()
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        println("\(questions)")
        if questions {
            return questions!.count
        }
        return 0
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("questionCell", forIndexPath: indexPath) as QuestionTableViewCell
//        println("\(questions![indexPath.row].title)")
        cell.titleText.text = questions![indexPath.row].title
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
