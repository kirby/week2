//
//  DetailViewController.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/30/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var question : Question?
    
    @IBOutlet weak var detailView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if question {
            self.title = "\(question!.question_id)"
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
