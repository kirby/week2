//
//  DetailViewController.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/30/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

protocol QuestionSelectedDelegate {
    func selectedQuestion(question : QuestionModel)
}

protocol ModelUpdatedDelegate {
    
    func selectedBadge(badge : BadgeModel)
    func selectedQuestion(question : QuestionModel)
    
    func modelUpdated(model : AnyObject)
}

class DetailViewController: UIViewController, ModelUpdatedDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var model : AnyObject?
    
    var question : QuestionModel?
    var badge : BadgeModel?
    
    var link : String?
    
    var modelUpdatedDelegate : ModelUpdatedDelegate?
    var selectedQuestionDelegate : QuestionSelectedDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modelUpdatedDelegate = self
//        self.selectedQuestionDelegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if self.splitViewController.collapsed {
            println("collapsed")
            
        }
        
        if link {
            var request = NSURLRequest(URL: NSURL(string: link))
            self.webView.loadRequest(request)
        }
        
    }
    
    // MARK: - ModelUpdatedDelegate
    
    func selectedQuestion(question: QuestionModel) {
        println("selectedQuestion \(question)")
        self.question = question
        self.link = question.link
    }
    
    func selectedBadge(badge: BadgeModel) {
        println("selectedBadge \(badge)")
        self.badge = badge
        self.link = badge.link
    }
    
    // MARK: -
    
    func modelUpdated(model : AnyObject) {
        println("selectedQuestion \(model)")
        self.model = model
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
