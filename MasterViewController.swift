//
//  MasterViewController.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/30/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UISearchBarDelegate {
    
    var selectedQuestionDelegate : QuestionSelectedDelegate?    // AppDelegate sets this up for us
    var networkController = NetworkController()
    
    var responses = Dictionary<String,AnyObject>()
    
    var questions : [QuestionModel]?
    var badges : [BadgeModel]?

    @IBOutlet weak var buttonBarItems: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func buttonToggle() {
        // fire off a new search
        search(searchBar.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //networkController.fetchQuestionsForSearchTerm("Swift", callback: handleSearchResponse)
        
        var badges = [BadgeModel]()
        var questions = [QuestionModel]()
        
        self.responses["badge"] = badges
        self.responses["questions"] = questions
        
        self.searchBar.delegate = self
        self.tableView.estimatedRowHeight = 40
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if self.splitViewController.collapsed {
            println("collapsed")
        }
    }
    
    func handleResponse(response : [AnyObject]?, errorDescription : String?) {
        if errorDescription {
            println("\(errorDescription)")
            return
        }
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.responses["search"] = response
            self.tableView.reloadData()
            })
    }
    
    func handleBadgeResponse(badges : [BadgeModel]?, errorDescription : String?) {
        if errorDescription {
            println("\(errorDescription)")
            return
        }
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.badges = badges
            self.tableView.reloadData()
            })
    }
    
    func handleSearchResponse(questions : [QuestionModel]?, errorDescription : String?) {
        if errorDescription {
            println("\(errorDescription)")
            return
        }
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.questions = questions
            self.tableView.reloadData()
            })
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        println("searchBarSearchButtonClicked")
        search(searchBar.text)
    }
    
    func search(searchTerm : String) {
        searchBar.resignFirstResponder()
        var encodedSearchTerm = searchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
//        networkController.fetchQuestionsForSearchTerm(encodedSearchTerm, callback: handleSearchResponse)
        
        if buttonBarItems.selectedSegmentIndex == 0 {
            questions = nil
            networkController.fetchQuestionsForSearchTerm(encodedSearchTerm, callback: handleSearchResponse)
        } else {
            badges = nil
            networkController.fetchBadgesForSearchTerm(encodedSearchTerm, callback: handleBadgeResponse)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        if (buttonBarItems.selectedSegmentIndex == 0) {
            if questions {return questions!.count}
        }
        
        if (buttonBarItems.selectedSegmentIndex == 1) {
            if badges {return badges!.count}
        }
        
        return 0
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as MasterTableViewCell
//        cell.textView.userInteractionEnabled = false
        
        if (buttonBarItems.selectedSegmentIndex == 0) {
            cell.textView.text = questions![indexPath.row].title
        }
        
        if (buttonBarItems.selectedSegmentIndex == 1) {
            cell.textView.text = badges![indexPath.row].name
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)  {
        println("selected row: \(indexPath.row)")
        if questions {
            println("selectedQuestionDelegate = \(selectedQuestionDelegate)")
            var detailVC = self.storyboard.instantiateViewControllerWithIdentifier("detailView") as DetailViewController
            
            if (buttonBarItems.selectedSegmentIndex == 0) {
                detailVC.selectedQuestion(questions![indexPath.row])
            }
            
            if (buttonBarItems.selectedSegmentIndex == 1) {
                detailVC.selectedBadge(badges![indexPath.row])
            }
            
            self.splitViewController.showDetailViewController(detailVC, sender: self)

            
//            selectedQuestionDelegate!.selectedQuestion(questions![indexPath.row])
        }
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
