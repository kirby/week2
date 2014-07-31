//
//  DetailViewController.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/30/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

protocol QuestionSelectedDelegate {
    func selectedQuestion(question : Question)
}

class DetailViewController: UIViewController, QuestionSelectedDelegate {
    @IBOutlet weak var label: UILabel!
    
    var question : Question?
    var selectedQuestionDelegate : QuestionSelectedDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedQuestionDelegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        super.viewWillAppear(animated)
        if self.splitViewController.collapsed {
            println("collapsed")
            
        }
        
        if question {
            self.label.text = question!.title
        }
        
    }
    
    // MARK: - QuestionSelectionDelegate
    
    func selectedQuestion(question: Question) {
        println("selectedQuestion \(question)")
//        self.label.text = question.title
        self.question = question
        
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
